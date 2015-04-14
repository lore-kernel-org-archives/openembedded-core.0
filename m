Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 22FC773CC5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 20:44:15 +0000 (UTC)
Received: by pacyx8 with SMTP id yx8so24388340pac.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 13:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=/uQ9Te7uCI5YalirmRFFssYcj2P8QOqx4u1KIgFVBKw=;
	b=tdUM6Ln5VvzXFV9LAGXi4zJ65XCH4K/ZLgyZc/g6bJSKdHVG6SOd8UPe/sQ6zTaTWI
	sMPku5wcGy3B+JzfDtNiXLgBqCa92fEBghslKtGo7uEd7q80tC0v0MATtcCOXe80rUNv
	CmyTjpgbmdTDykZdNqSR30xVoFJiRs12nugCS36FOBtIaecd/rT4bagdvQCtQECTitnl
	qLjg4QooOqKWY09CSqObgoiEaRtU5Rwv6VV89xGdVfZ574keHyvE8oDSV151EWj6A+/T
	H4NR+iH1FeKQ6THklGM/q1uYT8axQh3bvLb3np8i5gtqGmvnbbhoF/EQ8JXs7eZ+MX4z
	4gwA==
X-Received: by 10.68.231.66 with SMTP id te2mr40046839pbc.118.1429044257032;
	Tue, 14 Apr 2015 13:44:17 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:a1c1:e145:5a71:282b?
	([2601:c:a700:3ba7:a1c1:e145:5a71:282b])
	by mx.google.com with ESMTPSA id dp7sm1977105pdb.10.2015.04.14.13.44.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Apr 2015 13:44:15 -0700 (PDT)
Message-ID: <552D7C1D.3040905@gmail.com>
Date: Tue, 14 Apr 2015 13:44:13 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1428684268-55681-1-git-send-email-bevenson@melinkcorp.com>	<BN3PR0501MB1090C5485C34B9B9C6BB1253BBE60@BN3PR0501MB1090.namprd05.prod.outlook.com>
	<BN3PR0501MB109071C50855A918E8395B83BBE60@BN3PR0501MB1090.namprd05.prod.outlook.com>
In-Reply-To: <BN3PR0501MB109071C50855A918E8395B83BBE60@BN3PR0501MB1090.namprd05.prod.outlook.com>
Subject: Re: [dizzy][PATCH] base-files: Check for /run and /var/lock softlinks on upgrade
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
X-List-Received-Date: Tue, 14 Apr 2015 20:44:19 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 04/14/2015 01:41 PM, Bryan Evenson wrote:
> All,
>
>> -----Original Message-----
>> From: Bryan Evenson
>> Sent: Tuesday, April 14, 2015 11:47 AM
>> To: Bryan Evenson; openembedded-core@lists.openembedded.org
>> Subject: RE: [oe-core][dizzy][PATCH] base-files: Check for /run and /var/lock
>> softlinks on upgrade
>>
>> All,
>>
>>> -----Original Message-----
>>> From: Bryan Evenson [mailto:bevenson@melinkcorp.com]
>>> Sent: Friday, April 10, 2015 12:44 PM
>>> To: openembedded-core@lists.openembedded.org
>>> Cc: Bryan Evenson
>>> Subject: [oe-core][dizzy][PATCH] base-files: Check for /run and
>>> /var/lock softlinks on upgrade
>>>
>>> Commit ea647cd9eebdc3e3121b84074519c4bb305adac9 moved the
>> locations of
>>> /run and /var/lock to match the FHS 3 draft specifications.
>>> However, the install doesn't remove the existing directories.
>>> As a result, upgrading a system may result in /run as a softlink to
>>> /var/run and /var/run as a softlink to /run, creating a circular link.
>>>
>>> During pre and post-install, check for the existence of the old
>>> softlinks, move the old file contents to a temporary location, remove
>>> the softlinks, and restore the directory contents after installation.
>>>
>>
>> I went about this wrong, as I forgot that items may be mounted under /run.
>> I'm working on a different solution in which the preinst step removes the
>> /run and /var/lock softlinks if they exist.  However, I still have odd issues.
>> The first reboot works fine, but then on the next reboot there is a link inside
>> /run for "run -> /var/run" and inside /var there is a link for "run ->
>> /var/volatile/run".  This doesn't match up with the files listed in the base-files
>> recipe.  I can't figure out where these links are coming from.  Has anyone else
>> had issues upgrading base-files?
>
> The root cause seems to be the initscripts package.  The script /etc/volatile.cache is generated by /etc/init.d/populate-volatile.sh.  On upgrade, this file is not removed and may not necessarily be regenerated.  As a result, on the next boot the script /etc/volatile.cache repopulates directories as it remembers them which may not be accurate.  In my case, after the reboot, the /etc/volatile.cache script deleted everything from a USB flash drive attached to my system when it attempted to remove /run.
>
> So to get this portion of the upgrade to work, I had to:
> 1. Remove the softlinks for /run and /var/lock through a preinst script in the base-files recipe
> 2. Remove /etc/volatile.cache as a postint script in the initscripts recipe
>
> Would someone like for me to submit a patch?

sure.

- armin
>
> Thanks,
> Bryan
>
>>
>> Thanks,
>> Bryan
>>
>>> Signed-off-by: Bryan Evenson <bevenson@melinkcorp.com>
>>> ---
>>>   meta/recipes-core/base-files/base-files_3.0.14.bb | 55
>>> +++++++++++++++++++++++
>>>   1 file changed, 55 insertions(+)
>>>
>>> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb
>>> b/meta/recipes-core/base-files/base-files_3.0.14.bb
>>> index 07f5c54..71cea08 100644
>>> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
>>> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
>>> @@ -66,6 +66,41 @@ hostname = "openembedded"
>>>
>>>   BASEFILESISSUEINSTALL ?= "do_install_basefilesissue"
>>>
>>> +# In previous versions of base-files, /run was a softlink to /var/run
>>> +and the # directory was located in /var/volatlie/run.  Also,
>>> +/var/lock was a softlink # to /var/volatile/lock which is where the
>>> +real directory was located.  Now, # /run and /run/lock are the real
>>> +directories.  If we are upgrading, we may # need to remove the symbolic
>> links first before we create the directories.
>>> +# Otherwise the directory creation will fail and we will have
>>> +circular symbolic # links.
>>> +#
>>> +# If we do need to remove the symbolic links first, we also need to
>>> +preserve # all the contents of the directory so running programs can
>>> +find the files that # are in use in these directories.  Move the
>>> +contents to a temporary
>>> directory
>>> +# during pre-install to protect the contents pkg_preinst_${PN} () {
>>> +    #!/bin/sh -e
>>> +    if [ x"$D" = "x" ]; then
>>> +        if [ -e "/var/volatile/lock" ]; then
>>> +            # Move the contents of /var/volatile/lock to a temporary directory
>>> +            mkdir -p /run_lock_tmp
>>> +            mv /var/volatile/lock/* /run_lock_tmp/
>>> +
>>> +            # Remove the current directory
>>> +            rm -rf /var/volatile/lock
>>> +        fi
>>> +
>>> +        if [ -h "/run" ]; then
>>> +            # Move the contents of /run to a temporary directory
>>> +            mkdir -p /run_tmp
>>> +            mv /run/* /run_tmp/
>>> +
>>> +            # Remove the current directory
>>> +            rm -rf /run
>>> +        fi
>>> +    fi
>>> +}
>>> +
>>>   do_install () {
>>>   	for d in ${dirs755}; do
>>>   		install -m 0755 -d ${D}$d
>>> @@ -79,6 +114,7 @@ do_install () {
>>>   	for d in ${volatiles}; do
>>>   		ln -sf volatile/$d ${D}${localstatedir}/$d
>>>   	done
>>> +
>>>   	ln -snf ../run ${D}${localstatedir}/run
>>>   	ln -snf ../run/lock ${D}${localstatedir}/lock
>>>
>>> @@ -144,6 +180,25 @@ do_install_append_linuxstdbase() {
>>>           done
>>>   }
>>>
>>> +# If we are on the actual hardware, check if we had to move /run and
>>> /run/lock.
>>> +# If so, copy the temporary directory contents to their new locations.
>>> +pkg_postinst_${PN} () {
>>> +    #!/bin/sh -e
>>> +    if [ x"$D" = "x" ]; then
>>> +        if [ -e "/run_tmp" ]; then
>>> +            mv /run_tmp/* /run/
>>> +            rmdir /run_tmp
>>> +        fi
>>> +
>>> +        if [ -e "/run_lock_tmp/" ]; then
>>> +            mv /run_lock_tmp/* /run/lock
>>> +            rmdir /run_lock_tmp
>>> +        fi
>>> +    else
>>> +        exit 1
>>> +    fi
>>> +}
>>> +
>>>   PACKAGES = "${PN}-doc ${PN} ${PN}-dev ${PN}-dbg"
>>>   FILES_${PN} = "/"
>>>   FILES_${PN}-doc = "${docdir} ${datadir}/common-licenses"
>>> --
>>> 2.1.0
>

