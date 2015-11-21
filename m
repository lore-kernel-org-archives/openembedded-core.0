Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0C52E60123
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Nov 2015 16:24:36 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so147019725pac.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Nov 2015 08:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=TjJ8oTameUZuuMo2yD8wmbAV4VqswPTPeV7IxpjGtwQ=;
	b=mVE5TwFQ9Q8LruuojddhZqPobPOANuVUJwTCxJnUHjXtXjiULj8V8U7aAgvx/jYs/y
	saLeCkqovWJhxla0e7h56e0+P89cvvaMxYQVACWScczLtGnbfMQldCWRKPZ4okRIf6Gn
	xKWigcywRghjNwjU8VENnfJRuKnVsNu2UBnvNE5i/XmHyf+nPkByzs8LRncLeQCUjGM4
	/A5eC1QydUlt7TuUFvrH7qK+tCI8Ns+pCRqHnQfKh+2VLJRzanYQH1w22JNoF4xuKTZm
	rOwjZKBjnEwhbc6d8cEefMBV542AJPrnRoMe1tI98jxqSA5fKuGvVhcOS8a7Suzv6FVU
	jBag==
X-Received: by 10.98.74.26 with SMTP id x26mr6234212pfa.15.1448123076951;
	Sat, 21 Nov 2015 08:24:36 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:b135:9b8c:cccd:ccf2?
	([2601:202:4000:1239:b135:9b8c:cccd:ccf2])
	by smtp.googlemail.com with ESMTPSA id
	oz2sm4151808pbc.49.2015.11.21.08.24.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 Nov 2015 08:24:35 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1447145891-13916-1-git-send-email-Martin.Jansa@gmail.com>
	<20151110090527.GA2561@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56509AB9.3090309@gmail.com>
Date: Sat, 21 Nov 2015 08:24:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151110090527.GA2561@jama>
Subject: Re: [PATCH][master][jethro][fido][dizzy] image.bbclass: don't add BUILDNAME to do_rootfs vardeps
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
X-List-Received-Date: Sat, 21 Nov 2015 16:24:37 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 11/10/2015 01:05 AM, Martin Jansa wrote:
> On Tue, Nov 10, 2015 at 09:58:11AM +0100, Martin Jansa wrote:
>> * it was explicitly excluded in rootfs_*.bbclass which doesn't use this
>>   variable anymore, so we can drop it there, but I don't understand why
>>   it was added explicitly in image.bbclass, we don't want image to
>>   rebuild just because timestamp is different.
>> * causes following ERROR when bitbake -S is used:
>>   NOTE: Reparsing files to collect dependency data
>>   Writing locked sigs to locked-sigs.inc
>>   ERROR: Bitbake's cached basehash does not match the one we just generated (some-image.bb.do_rootfs)!
>>   ERROR: The mismatched hashes were 508d48864b14ce94ca69ea6062f9e5f8 and f81487a10e995426d493a4a50b088721
>>   $ bitbake-diffsigs BUILD/sstate-diff/c*/foo/bar/some-image/*do_rootfs.sig*
>>   basehash changed from f81487a10e995426d493a4a50b088721 to 263d1d44d6fda0101c89de3b2a489af9
>>   Variable BUILDNAME value changed from '201511100025' to '201511100037'
> 
> I'm sorry, only the rootfs_*.bbclass part does apply to all 4 branches
> and it's just cleanup, so it doesn't need to be backported.
> 
> For image.bbclass in dizzy we need to backport eb6305d03723527830976c3a4ce2342a0e09eefc (included in fido).
> Armin: can you take care of ^?

yep, no problem.

- armin

> 
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  meta/classes/image.bbclass      | 2 +-
>>  meta/classes/rootfs_deb.bbclass | 1 -
>>  meta/classes/rootfs_ipk.bbclass | 1 -
>>  meta/classes/rootfs_rpm.bbclass | 1 -
>>  4 files changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index 1c0fda7..c0f9775 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -94,7 +94,7 @@ def rootfs_variables(d):
>>                   'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','RM_OLD_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS','SDK_OS',
>>                   'SDK_OUTPUT','SDKPATHNATIVE','SDKTARGETSYSROOT','SDK_DIR','SDK_VENDOR','SDKIMAGE_INSTALL_COMPLEMENTARY','SDK_PACKAGE_ARCHS','SDK_OUTPUT','SDKTARGETSYSROOT','MULTILIBRE_ALLOW_REP',
>>                   'MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS','PACKAGE_ARCHS',
>> -                 'PACKAGE_CLASSES','TARGET_VENDOR','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','BUILDNAME','USE_DEVFS',
>> +                 'PACKAGE_CLASSES','TARGET_VENDOR','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
>>                   'STAGING_KERNEL_DIR','COMPRESSIONTYPES']
>>      variables.extend(command_variables(d))
>>      variables.extend(variable_depends(d))
>> diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
>> index d51b458..f79fca6 100644
>> --- a/meta/classes/rootfs_deb.bbclass
>> +++ b/meta/classes/rootfs_deb.bbclass
>> @@ -8,7 +8,6 @@ ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
>>  do_rootfs[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot"
>>  do_populate_sdk[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot bzip2-native:do_populate_sysroot"
>>  do_rootfs[recrdeptask] += "do_package_write_deb"
>> -rootfs_deb_do_rootfs[vardepsexclude] += "BUILDNAME"
>>  do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
>>  
>>  do_rootfs[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
>> diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
>> index 6139cc7..bb6f777 100644
>> --- a/meta/classes/rootfs_ipk.bbclass
>> +++ b/meta/classes/rootfs_ipk.bbclass
>> @@ -13,7 +13,6 @@ do_rootfs[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_popu
>>  do_populate_sdk[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
>>  do_rootfs[recrdeptask] += "do_package_write_ipk"
>>  do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
>> -rootfs_ipk_do_rootfs[vardepsexclude] += "BUILDNAME"
>>  
>>  do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
>>  do_populate_sdk[lockfiles] += "${WORKDIR}/ipk.lock"
>> diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
>> index d85d001..b4cd55b 100644
>> --- a/meta/classes/rootfs_rpm.bbclass
>> +++ b/meta/classes/rootfs_rpm.bbclass
>> @@ -22,7 +22,6 @@ do_rootfs[depends] += "${RPMROOTFSDEPENDS}"
>>  do_populate_sdk[depends] += "${RPMROOTFSDEPENDS}"
>>  
>>  do_rootfs[recrdeptask] += "do_package_write_rpm"
>> -rootfs_rpm_do_rootfs[vardepsexclude] += "BUILDNAME"
>>  do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
>>  
>>  # RPM doesn't work with multiple rootfs generation at once due to collisions in the use of files 
>> -- 
>> 2.6.2
>>
> 
> 
> 

