Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8F8EF61AD1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 14:55:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5EEt0EJ016278
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 07:55:01 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.235) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Fri, 14 Jun 2013 07:55:00 -0700
Message-ID: <51BB2EC4.7000300@windriver.com>
Date: Fri, 14 Jun 2013 09:55:00 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1371197357-10706-1-git-send-email-jackie.huang@windriver.com>
	<CAJTo0LaX4ZSoN0mNr9eaQLHm7LAh1xEahBfCiimGv4FHSyrTfA@mail.gmail.com>
In-Reply-To: <CAJTo0LaX4ZSoN0mNr9eaQLHm7LAh1xEahBfCiimGv4FHSyrTfA@mail.gmail.com>
Subject: Re: [PATCH] acl attr libcap: mark shared libraries executable
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
X-List-Received-Date: Fri, 14 Jun 2013 14:55:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/14/13 3:53 AM, Burton, Ross wrote:
> On 14 June 2013 09:09,  <jackie.huang@windriver.com> wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> While it is not necessary that shared libraries be executable,
>> if they are not marked as such bitbake will not examine them
>> for debug information.  So, we make them executable at the end of
>> installation.
>
> Wouldn't it be preferable to change the class that does the debug
> extraction so that it doesn't require executable bits on libraries?
> Fix the cause not the symptoms and all that.

I thought the class specifically looked for items in ${base_libdir} and 
${libdir} as well as executables elsewhere in the system.

We don't want to blindly scan and filter everything that is ELF, so the 
executable flag makes sense outside of the libdir.

from package.bbclass, split_and_strip_files:

     libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir", True))
     baselibdir = os.path.abspath(dvar + os.sep + d.getVar("base_libdir", True))

         for root, dirs, files in cpath.walk(dvar):
             for f in files:

                 # Check its an excutable
                 if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & 
stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
                         or ((file.startswith(libdir) or 
file.startswith(baselibdir)) and ".so" in f):

                     if elf ...
                         add to list of files to split/strip

So the above iterates and checks if it is executable -or- lives in the libdir 
and baselibdir directory -and- contains '.so' in the name.

If this is not working, we need to fix it..  If this is working, but something 
later isn't, we need to fix that then.

It may be that the tool we're using (debugedit) requires the binaries to be 
executable, if that is the case then we'll need to capture the original perms, 
add executable, run debugedit and restore them.  But this will need some further 
investigation.

> Ross
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


