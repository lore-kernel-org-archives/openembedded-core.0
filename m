Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F05C001DC
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 12:30:26 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.12434.1689769819559489841
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 05:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DDVr+jHv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E70B860006;
	Wed, 19 Jul 2023 12:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689769817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p27iJ9yltUTDOxqBtqCrgzfmKC4qj6dtB6uYOBmHTjM=;
	b=DDVr+jHv07Jm53Ikikc8XjAshmT1bLKzPEVHBFEPxx7d+t7QhZgfa1kVttlQwXJpR1Pw67
	PQDEJb/r9MRrVoRrd5kscbThuQGEmWuJPoxhjqhMwGixKR5TurZroRYPf9iys4NbyttvFv
	mIDshaISHUJxYsfacSLk/9aUPXZsVTwiJOYrExsRezLCdxDY8/Ctvb0S2/nmqGKiHPNOV/
	uBm03/lUJXZwr/L78wZh/9wBUk9x3BtoO9O8ch4ZS6t/a1zAKIz2l7Zw5W/oqeCBoNE1Xc
	w5+mScAD75VxiDakjw/T47id39jNoos5bBg/y0Vaxjxrjmzh9kkraiygRg2mMA==
Date: Wed, 19 Jul 2023 14:30:16 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-Core][PATCH] eudev: Add group sgx to eudev package
Message-ID: <20230719123016beb329ff@mail.local>
References: <20230714140955.28052-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714140955.28052-1-alex.kiernan@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 12:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184581

Hello,

I had a bit of trouble to find this but this causes the following
oe-selftest failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/2274/steps/14/logs/stdio

2023-07-18 20:56:16,128 - oe-selftest - INFO - gdbserver.GdbServerTest.test_gdb_server (subunit.RemotedTestCase)
2023-07-18 20:56:16,129 - oe-selftest - INFO -  ... ERROR
Stderr:
2023-07-18 20:32:39,581 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/pokybuild/yocto-worker/oe-selftest/build/build-st-836115/conf/local.conf
2023-07-18 20:32:39,582 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2023-07-18 20:56:16,129 - oe-selftest - INFO - 14: 7/58 224/529 (269.86s) (0 failed) (gdbserver.GdbServerTest.test_gdb_server)
2023-07-18 20:56:16,129 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest/build/meta/lib/oeqa/selftest/cases/gdbserver.py", line 43, in test_gdb_server
    shutil.unpack_archive(filename, debugfs)
  File "/usr/lib64/python3.11/shutil.py", line 1323, in unpack_archive
    func(filename, extract_dir, **kwargs)
  File "/usr/lib64/python3.11/shutil.py", line 1244, in _unpack_tarfile
    tarobj.extractall(extract_dir, filter=filter)
  File "/usr/lib64/python3.11/tarfile.py", line 2257, in extractall
    self._extract_one(tarinfo, path, set_attrs=not tarinfo.isdir(),
  File "/usr/lib64/python3.11/tarfile.py", line 2324, in _extract_one
    self._handle_fatal_error(e)
  File "/usr/lib64/python3.11/tarfile.py", line 2320, in _extract_one
    self._extract_member(tarinfo, os.path.join(path, tarinfo.name),
  File "/usr/lib64/python3.11/tarfile.py", line 2403, in _extract_member
    self.makefile(tarinfo, targetpath)
  File "/usr/lib64/python3.11/tarfile.py", line 2448, in makefile
    with bltn_open(targetpath, "wb") as target:
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^
PermissionError: [Errno 13] Permission denied: '/tmp/debugfs-j_xgxhkm/./etc/gshadow'

On 14/07/2023 15:09:55+0100, Alex Kiernan wrote:
> Fix startup warning:
> 
>   udevd[171]: specified group 'sgx' unknown
> 
> This mirrors the change in bab455cd9b1b ("systemd: add group sgx to udev
> package") for systemd-udev.
> 
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> 
>  meta/recipes-core/udev/eudev_3.2.12.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/udev/eudev_3.2.12.bb b/meta/recipes-core/udev/eudev_3.2.12.bb
> index 572ccecafd0c..4268bcc2c5de 100644
> --- a/meta/recipes-core/udev/eudev_3.2.12.bb
> +++ b/meta/recipes-core/udev/eudev_3.2.12.bb
> @@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "ccdd64ec3c381d3c3ed0e99d2e70d1f62988c7763de89ca7bdffafa5ea
>  
>  GITHUB_BASE_URI = "https://github.com/eudev-project/eudev/releases"
>  
> -inherit autotools update-rc.d qemu pkgconfig features_check manpages github-releases
> +inherit autotools update-rc.d qemu pkgconfig features_check manpages github-releases useradd
>  
>  CONFLICT_DISTRO_FEATURES = "systemd"
>  
> @@ -85,3 +85,6 @@ pkg_postinst:${PN}-hwdb () {
>  pkg_prerm:${PN}-hwdb () {
>  	rm -f $D${sysconfdir}/udev/hwdb.bin
>  }
> +
> +USERADD_PACKAGES = "${PN}"
> +GROUPADD_PARAM:${PN} = "-r sgx"
> -- 
> 2.39.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184267): https://lists.openembedded.org/g/openembedded-core/message/184267
> Mute This Topic: https://lists.openembedded.org/mt/100141828/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

