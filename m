Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7DBD165E0C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Oct 2014 23:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 55974314E937
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 01:39:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id kg5ncPtWKF8C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 01:39:09 +0200 (CEST)
Received: from [172.22.22.61] (55d41bdb.access.ecotel.net [85.212.27.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id DD4B1314E928
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 01:39:08 +0200 (CEST)
Message-ID: <5434799B.7020503@opendreambox.org>
Date: Wed, 08 Oct 2014 01:39:07 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1412712030-12657-1-git-send-email-anibal.limon@linux.intel.com>	<54344EC9.2040303@opendreambox.org>
	<54346DFB.8030802@linux.intel.com>
In-Reply-To: <54346DFB.8030802@linux.intel.com>
Subject: Re: [PATCH] busybox: fix upgrade problem with deb packages
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
X-List-Received-Date: Tue, 07 Oct 2014 23:39:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 08.10.2014 00:49, Aníbal Limón wrote:
> I reviewed the patches and looks good, only i have a comment
> in this file,
> 
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=obi/dora&id=a5f18409d1bf2877f898b902cafc317cbf7462e4
> 
> 
> I didn't know if the same apply for rpm and ipk.

I guess so. I'm pretty certain that opkg behaves just like dpkg in this
regard. I never used rpm, though.

To reproduce the problem, boot an image containing busybox, but not
bash. Then install bash and deinstall it again. Deinstallation fails,
resulting in a dangling symlink (/bin/sh -> /bin/bash).

> There are a lot of patches,  Do you have a plan to port them to master?
> 
> I can help with that.

I'd like to, but I won't have time to do any testing with master during
the next weeks. I could rebase my patches onto master and provide a tree
for you to test. Or you could cherry-pick whatever patches you like and
submit them to the mailing list after testing. Most patches should apply
without changes, but those touching rootfs_deb.bbclass and
package_deb.bbclass will need some porting. What do you think?

Regards,
Andreas


> Best regards.
> 
> On 07/10/14 15:36, Andreas Oberritter wrote:
>> Hello Aníbal,
>>
>> On 07.10.2014 22:00, Aníbal Limón wrote:
>>> Busybox prerm scripts create temp directory and fill with
>>> symlinks to common utilities in order to upgrade itself, PATH
>>> is exported but dpkg didn't take a look of this links and fails.
>>>
>>> In order to fix,
>>>
>>>     Changed temp directory to /usr/loca/bin in debian packages.
>>>     Added missing links for utilities tar, find, tail, cut.
>>>
>>> Busybox syslog prerm script tries to stop the daemon but if already
>>> stopped returns 1 then causes that dpkg fails because it expects 0.
>>>
>>> In order to fix,
>>>
>>>     Added workaround to exit 0 in debian packages.
>>>
>>> [YOCTO #6768]
>> please don't overwrite files in /usr/local/bin! People may have their
>> own tools there.
>>
>> This, and the creation of these symlinks in a tmpdir in the first place,
>> looks wrong to me.
>>
>> I think you'd better get rid of update-alternatives-cworth and use an
>> implementation written in C.
>>
>> See
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=obi/dora
>> for many dpkg-related fixes including an offline-capable version of
>> dpkg's update-alternatives. I couldn't test these with master, but this
>> branch contains most if not all patches to dpkg backported from master
>> to dora.
>>
>> Regards,
>> Andreas
>>
>>> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
>>> ---
>>>   meta/recipes-core/busybox/busybox.inc | 46
>>> ++++++++++++++++++++++++++++++++++-
>>>   1 file changed, 45 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-core/busybox/busybox.inc
>>> b/meta/recipes-core/busybox/busybox.inc
>>> index bd66e4f..61f12b4 100644
>>> --- a/meta/recipes-core/busybox/busybox.inc
>>> +++ b/meta/recipes-core/busybox/busybox.inc
>>> @@ -377,13 +377,46 @@ pkg_postinst_${PN} () {
>>>               fi
>>>           done
>>>       fi
>>> +
>>> +    # Workaround for deb packages, clean
>>> +        if [ "$DPKG_MAINTSCRIPT_PACKAGE"x != x ]; then
>>> +        tmpdir='/usr/local/bin'
>>> +        rm -f $tmpdir/[
>>> +        rm -f $tmpdir/test
>>> +        rm -f $tmpdir/head
>>> +        rm -f $tmpdir/sh
>>> +        rm -f $tmpdir/basename
>>> +        rm -f $tmpdir/echo
>>> +        rm -f $tmpdir/mv
>>> +        rm -f $tmpdir/ln
>>> +        rm -f $tmpdir/dirname
>>> +        rm -f $tmpdir/rm
>>> +        rm -f $tmpdir/sed
>>> +        rm -f $tmpdir/sort
>>> +        rm -f $tmpdir/grep
>>> +        rm -f $tmpdir/tar
>>> +        rm -f $tmpdir/find
>>> +        rm -f $tmpdir/tail
>>> +        rm -f $tmpdir/cut
>>> +        fi
>>>   }
>>>     pkg_prerm_${PN} () {
>>>       # This is so you can make busybox commit suicide - removing
>>> busybox with no other packages
>>>       # providing its files, this will make update-alternatives work,
>>> but the update-rc.d part
>>>       # for syslog, httpd and/or udhcpd will fail if there is no
>>> other package providing sh
>>> -    tmpdir=`mktemp -d /tmp/busyboxrm-XXXXXX`
>>> +
>>> +        # Workaround for deb packages, dpkg don't take into account
>>> exported PATH variable,
>>> +        # use instead local directory.
>>> +        if [ "$DPKG_MAINTSCRIPT_PACKAGE"x == x ]; then
>>> +        tmpdir=`mktemp -d /tmp/busyboxrm-XXXXXX`
>>> +        else
>>> +        tmpdir='/usr/local/bin'
>>> +        if [ ! -e $tmpdir ]; then
>>> +            mkdir -p $tmpdir
>>> +        fi
>>> +    fi
>>> +
>>>       ln -s /bin/busybox $tmpdir/[
>>>       ln -s /bin/busybox $tmpdir/test
>>>       ln -s /bin/busybox $tmpdir/head
>>> @@ -397,6 +430,11 @@ pkg_prerm_${PN} () {
>>>       ln -s /bin/busybox $tmpdir/sed
>>>       ln -s /bin/busybox $tmpdir/sort
>>>       ln -s /bin/busybox $tmpdir/grep
>>> +    ln -s /bin/busybox $tmpdir/tar
>>> +    ln -s /bin/busybox $tmpdir/find
>>> +    ln -s /bin/busybox $tmpdir/tail
>>> +    ln -s /bin/busybox $tmpdir/cut
>>> +
>>>       export PATH=$PATH:$tmpdir
>>>   }
>>>   @@ -405,6 +443,12 @@ pkg_prerm_${PN}-syslog () {
>>>       if test "x$D" = "x"; then
>>>           if test "$1" = "upgrade" -o "$1" = "remove"; then
>>>               /etc/init.d/syslog stop
>>> +
>>> +            # Workaround for deb packages, if syslog is already
>>> stopped returns
>>> +            # 1 but dpkg expects 0 and then fails.
>>> +            if [ "$DPKG_MAINTSCRIPT_PACKAGE"x != x ]; then
>>> +                exit 0
>>> +            fi
>>>           fi
>>>       fi
>>>   }
>>>
> 


