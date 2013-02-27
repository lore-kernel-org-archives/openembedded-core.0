Received: from mail-ia0-f174.google.com ([209.85.210.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UAUkt-00085X-UI
	for Openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 01:20:20 +0100
Received: by mail-ia0-f174.google.com with SMTP id u20so3934093iag.5
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 16:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=xXiaPAAlt2nmzOgUfMNGqKYJSU8FnZflU4tab/VvuME=;
	b=vVxM29rg57buFAs9p8aH1sLeW1YGHVk6C9gBiQeJlv99FLiy6HgM6RVwSu+UCeotVm
	w/omII35gwhgtMm9+NrZFPOSI6RM7y8JidegULUYsLrdispCZ+YSzh/elpGpyn2FrYvR
	/+2CYRtmpTAPPmlcUku7qA9ONlU5OYZDArI2Ukq79vCk9BjbCj/jrXDwTvFDxSmS9eHK
	Ct1+GlfKiXTHTcIaX8alqhybRbxWEXf6W69jY4oJrcTo72t7Ks1qIscWJbXRhUqnTIEa
	0M+qMXqy2hjIBOLqaEEpnwAkzYCl5YpLV4HDU7KrznXy/AqbMegP/ugrnElqDoSyy2o+
	S73w==
X-Received: by 10.50.56.141 with SMTP id a13mr115292igq.24.1361923436897; Tue,
	26 Feb 2013 16:03:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.74.163 with HTTP; Tue, 26 Feb 2013 16:03:26 -0800 (PST)
In-Reply-To: <4DDB2CE82D9BF44DB2EC2903AD859F8185591B7C@ALA-MBB.corp.ad.wrs.com>
References: <1361817899-22185-1-git-send-email-rich.dubielzig@windriver.com>
	<512BF7AB.70302@linux.intel.com>
	<4DDB2CE82D9BF44DB2EC2903AD859F8185591B7C@ALA-MBB.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Feb 2013 16:03:26 -0800
Message-ID: <CAMKF1sp374+xDTYZyDAtL3Pu8Lo3V5c7YY5UOuVU9WA25ddpzw@mail.gmail.com>
To: "Dubielzig, Rich" <rich.dubielzig@windriver.com>
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nfs-utils: Add scratch directory for NFS upcall state storage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 00:20:20 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 26, 2013 at 12:02 PM, Dubielzig, Rich
<rich.dubielzig@windriver.com> wrote:
> I can make this change, but if ${localstatedir} ends up being different than /var it would not be consistent with current kernel code which hardcodes the path "/var/lib/nfs/v4recovery" by default in fs/nfsd/nfs4recover.c
>
> http://lxr.linux.no/#linux+v3.8/fs/nfsd/nfs4recover.c

too bad. I think if you add this to commend and keep it hardcoded that
will be better for future reference IMO so we know why we
used /var and not conf var.

>
> -Rich
> ________________________________________
> From: Saul Wold [sgw@linux.intel.com]
> Sent: Monday, February 25, 2013 3:45 PM
> To: Dubielzig, Rich
> Cc: Openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] nfs-utils: Add scratch directory for NFS upcall state storage
>
> On 02/25/2013 10:44 AM, Rich Dubielzig wrote:
>> When the /var/lib/nfs/v4recovery directory is not present, NFSD cannot
>> record the upcall state and cannot end the 90-second grace period on
>> startup.  This is true even when NFS4 is not being served according to
>> nfsstat.
>>
>> More details and discussion here:
>> https://lkml.org/lkml/2012/6/11/206
>>
>> Signed-off-by: Rich Dubielzig <rich.dubielzig@windriver.com>
>> ---
>>   .../nfs-utils/nfs-utils_1.2.3.bb                   |    5 ++++-
>>   1 files changed, 4 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
>> index 84c4464..a0b2399 100644
>> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
>> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
>> @@ -12,7 +12,7 @@ DEPENDS = "libcap libnfsidmap libevent util-linux tcp-wrappers"
>>   RDEPENDS_${PN} = "rpcbind"
>>   RRECOMMENDS_${PN} = "kernel-module-nfsd"
>>
>> -PR = "r4"
>> +PR = "r5"
>>
>>   SRC_URI = "${SOURCEFORGE_MIRROR}/nfs/nfs-utils-${PV}.tar.bz2 \
>>              file://nfs-utils-1.0.6-uclibc.patch \
>> @@ -58,4 +58,7 @@ do_install_append () {
>>       rm -f ${D}${sbindir}/rpcdebug
>>       rm -f ${D}${sbindir}/rpcgen
>>       rm -f ${D}${sbindir}/locktest
>> +
>> +     # needed to allow NFSD to end its grace period
>> +     install -d ${D}/var/lib/nfs/v4recovery
>
> This should really use ${localstatedir} instead of var, it would also be
> better to co-locate this with the other directory creations earlier in
> the do_install_append().
>
> Sau!
>
>>   }
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


