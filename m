Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6D8E3719B2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 14:35:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v44EZtZV004613
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 May 2017 07:35:55 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 4 May 2017 07:35:54 -0700
To: <openembedded-core@lists.openembedded.org>
References: <c70316f009e94504b29ff2b9d177dd33@XBOX02.axis.com>
	<b5e9622b-3b01-a793-21ea-b15ea730e8bd@linux.intel.com>
	<e361d15615e24c2eb9cc5b799bcfe834@XBOX02.axis.com>
	<CA+chaQdNVsBGQquX-KSUmHB9aOTDSc2awgS4rSMndMQwR+JvhQ@mail.gmail.com>
	<90a886fc-2d96-5a8c-7d3c-42b97169870c@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <dbe8730e-9919-1c60-2ca0-21c939496e42@windriver.com>
Date: Thu, 4 May 2017 09:35:54 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <90a886fc-2d96-5a8c-7d3c-42b97169870c@windriver.com>
Subject: Re: Regression with RPM4 and unversioned DSOs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 May 2017 14:35:54 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 5/4/17 9:31 AM, Mark Hatle wrote:
> On 5/4/17 6:34 AM, Martin Jansa wrote:
>> You might want to check the output of package_do_shlibs function
>> in meta/classes/package.bbclass in case it's already missing there.
> 
> I'm pretty sure this was generated in the older case in the "package_do_filedeps".
> 
> The system ran rpmdeps, which collected the individual file dependencies.  These
> were collected into 'FILERPROVIDES_file_pkg' and 'FILERDEPENDS_file_pkg'.  The
> package manager could then choose to collect them or ignore them.  RPM5 work
> collected these.
> 
> 
> Looking at the the latest, that function is still present.  So investigating if
> the contents of the FILERPROVIDES and FILERDEPENDS is correct or not is where I
> would start.
> 
> 
> Then look at where the spec file is generated and such.  Those items should be
> used there as well.

Found where they are used in the spec file generated, package_rpm.bbclass:

    def dump_filerdeps(varname, outfile, d):
        outfile.write("#!/usr/bin/env python\n\n")
        outfile.write("# Dependency table\n")
        outfile.write('deps = {\n')
        for pkg in packages.split():
            dependsflist_key = 'FILE' + varname + 'FLIST' + "_" + pkg
            dependsflist = (d.getVar(dependsflist_key, True) or "")
            for dfile in dependsflist.split():
                key = "FILE" + varname + "_" + dfile + "_" + pkg
                depends_dict = bb.utils.explode_dep_versions(d.getVar(key, True)
or "")
                file = dfile.replace("@underscore@", "_")
                file = file.replace("@closebrace@", "]")
                file = file.replace("@openbrace@", "[")
                file = file.replace("@tab@", "\t")
                file = file.replace("@space@", " ")
                file = file.replace("@at@", "@")
                outfile.write('"' + pkgd + file + '" : "')
...
        outfile.write("import sys\n")
        outfile.write("while 1:\n")
        outfile.write("\tline = sys.stdin.readline().strip()\n")
        outfile.write("\tif not line:\n")
        outfile.write("\t\tsys.exit(0)\n")
        outfile.write("\tif line in deps:\n")
        outfile.write("\t\tprint(deps[line] + '\\n')\n")

What this function does is emulate the -external- (not internal) RPM dependency
generation API.  So when RPM itself runs, it will query this generate script
asking it for the dependencies of select files.  It will then return the
dependencies specific to those files.

So either rpm (4) is not asking the dependency generation script for the
dependencies properly -- or the contents of the script are simply wrong or
incomplete.

I'd still start with rpmdeps, but inside RPM itself (during packaging)
"use_internal_dependency_generator" should be off.. it needs to run the external
script.

--Mark

> 
> --Mark
> 
> 
>> On Thu, May 4, 2017 at 1:30 PM, Peter Kjellerstedt <peter.kjellerstedt@axis.com
>> <mailto:peter.kjellerstedt@axis.com>> wrote:
>>
>>     > -----Original Message-----
>>     > From: Alexander Kanavin [mailto:alexander.kanavin@linux.intel.com
>>     <mailto:alexander.kanavin@linux.intel.com>]
>>     > Sent: den 4 maj 2017 11:54
>>     > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com
>>     <mailto:peter.kjellerstedt@axis.com>>
>>     > Cc: OE Core (openembedded-core@lists.openembedded.org
>>     <mailto:openembedded-core@lists.openembedded.org>) <openembedded-
>>     > core@lists.openembedded.org <mailto:core@lists.openembedded.org>>
>>     > Subject: Re: Regression with RPM4 and unversioned DSOs
>>     >
>>     > On 05/04/2017 11:46 AM, Peter Kjellerstedt wrote:
>>     > > Since I would very much like to avoid having to add explicit runtime
>>     > > dependencies for all those dependencies that were previously
>>     > automatically
>>     > > detected, which would be a nightmare, I am now looking for any help
>>     > as to
>>     > > where to find the code that adds the dependencies on the packages
>>     > providing
>>     > > DSOs and to see if it is possible to change it to also detect
>>     > dependencies
>>     > > on unversioned DSOs.
>>     >
>>     > I'm not sure such implicit dependency detection at rpm generation point
>>     > is guaranteed to work in the first place. Don't we have a package_qa
>>     > check for this that should be failing? Can you publish a minimal layer
>>     > so I can reproduce locally?
>>     >
>>     > If you want to poke in rpm4 source, I think grepping for
>>     > use_internal_dependency_generator is a good starting point.
>>
>>     I was more thinking of the code in OE-core that generates the list of
>>     Requires that goes into the spec file. The matching sections from the
>>     spec files for the apta-utility package that I used as example in my
>>     first mail are (for Pyro):
>>
>>     Requires: libc6 >= 2.25
>>
>>     and (for Morty):
>>
>>     Requires: ld.so.1
>>     Requires: ld.so.1(GLIBC_2.4)
>>     Requires: libapta.so
>>     Requires: libc.so.6
>>     Requires: libc.so.6(GLIBC_2.0)
>>     Requires: libc.so.6(GLIBC_2.2)
>>     Requires: libc.so.6(GLIBC_2.3)
>>     Requires: libc.so.6(GLIBC_2.3.4)
>>     Requires: libc.so.6(GLIBC_2.4)
>>     Requires: libc.so.6(GLIBC_2.7)
>>     Requires: libc6 >= 2.24
>>     Requires: libubihelper.so
>>     Provides: elf(buildid) = 097a4862c4d6275838e8eb5759501630b7913485
>>
>>     So I think it is quite obvious that something has changed in OE-core in
>>     how these lists are generated... It is also apparent that the problem
>>     with lack of dependencies on packages with unversioned DSOs was already
>>     present in Morty. However, since it was hidden by the direct dependencies
>>     on the DSOs it was not apparent before.
>>
>>     Does RPM4 support dependencies on DSOs, or was that an RPM5 feature?
>>     If RPM4 supports it, why was it removed when dnf was introduced?
>>
>>     > Alex
>>
>>     //Peter
>>
>>     --
>>     _______________________________________________
>>     Openembedded-core mailing list
>>     Openembedded-core@lists.openembedded.org
>>     <mailto:Openembedded-core@lists.openembedded.org>
>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>>
>>
>>
>>
> 


