Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SNVXS-0006CW-Gw
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Apr 2012 22:43:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3QKY26v011905
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 26 Apr 2012 13:34:02 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 26 Apr 2012 13:34:01 -0700
Message-ID: <4F99B139.5040103@windriver.com>
Date: Thu, 26 Apr 2012 15:34:01 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120420 Thunderbird/12.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1335470063.20130.32.camel@ted>
In-Reply-To: <1335470063.20130.32.camel@ted>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: package_rpm.bbclass: Replace shell provides/requires script with python version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2012 20:43:42 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/26/12 2:54 PM, Richard Purdie wrote:
> The existing shell script is a fork bomb and forks off hundreds of
> grep/cur/wc calls as it reads from its input stream and iterates over
> the file data table for each line of input. This patch replaces the
> shell code with python code which doesn't exec anything and hence runs
> much faster without the exec() overhead. This speeds up rpm packaging
> considerably, as can be measured simply by timing it, or watching the
> processor utilisation.

Just an FYI, the intent was to replace this code completely with a patch to RPM 
when it got upgraded.  Then RPM could read in the dependencies directly and not 
have to worry about hacky script solutions.

Needless to say we're not yet at that point, so this is fine..  but hopefully 
we're getting closer.

--Mark

> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index ffe3b31..d90976b 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -1004,8 +1004,9 @@ python do_package_rpm () {
>
>   	# Construct per file dependencies file
>   	def dump_filerdeps(varname, outfile, d):
> -		outfile.write("#!/bin/sh\n")
> -		outfile.write("\n# Dependency table\n")
> +		outfile.write("#!/usr/bin/env python\n\n")
> +		outfile.write("# Dependency table\n")
> +		outfile.write('deps = {\n')
>   		for pkg in packages.split():
>   			dependsflist_key = 'FILE' + varname + 'FLIST' + "_" + pkg
>   			dependsflist = (d.getVar(dependsflist_key, True) or "")
> @@ -1018,7 +1019,7 @@ python do_package_rpm () {
>   				file = file.replace("@tab@", "\t")
>   				file = file.replace("@space@", " ")
>   				file = file.replace("@at@", "@")
> -				outfile.write("#" + pkgd + file + "\t")
> +				outfile.write('"' + pkgd + file + '" : "')
>   				for dep in depends_dict:
>   					ver = depends_dict[dep]
>   					if dep and ver:
> @@ -1027,12 +1028,15 @@ python do_package_rpm () {
>   						outfile.write(dep + " " + ver + " ")
>   					else:
>   						outfile.write(dep + " ")
> -				outfile.write("\n")
> -		outfile.write("\n\nwhile read file_name ; do\n")
> -		outfile.write("\tlength=$(echo \"#${file_name}\t\" | wc -c )\n")
> -		outfile.write("\tline=$(grep \"^#${file_name}\t\" $0 | cut -c ${length}- )\n")
> -		outfile.write("\tprintf \"%s\\n\" ${line}\n")
> -		outfile.write("done\n")
> +				outfile.write('",\n')
> +		outfile.write('}\n\n')
> +		outfile.write("import sys\n")
> +		outfile.write("while 1:\n")
> +		outfile.write("\tline = sys.stdin.readline().strip()\n")
> +		outfile.write("\tif not line:\n")
> +		outfile.write("\t\tsys.exit(0)\n")
> +		outfile.write("\tif line in deps:\n")
> +		outfile.write("\t\tprint(deps[line] + '\\n')\n")
>
>   	# OE-core dependencies a.k.a. RPM requires
>   	outdepends = workdir + "/" + srcname + ".requires"
>
>



