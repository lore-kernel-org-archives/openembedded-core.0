Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544F2C433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 15:06:01 +0000 (UTC)
Subject: Re: [meta][dunfell][PATCH] libinput: Add fix for CVE-2022-1215
To: openembedded-core@lists.openembedded.org
From: "Ranjitsinh Rathod" <ranjitsinhrathod1991@gmail.com>
X-Originating-Location: Ahmedabad, Gujarat, IN (103.85.10.165)
X-Originating-Platform: Linux Chrome 101
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 10 May 2022 08:05:56 -0700
References: <20220509062438.12448-1-badganchipv@gmail.com>
In-Reply-To: <20220509062438.12448-1-badganchipv@gmail.com>
Message-ID: <21438.1652195156118038664@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="iYFtxa9YPZScnySDkaJs"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 15:06:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165459

--iYFtxa9YPZScnySDkaJs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

It seems something is wrong with this patch and also in the patching tool w=
ithin Yocto as well.

When I apply this patch, it is getting applied cleanly, without any warning=
s and/or patch-fuzz, which means the source code should reflect as per the =
patch.
But when I go to the source code on the path "build/tmp/work/<architecture>=
/libinput/1.15.2-r0/libinput-1.15.2" and see the file "src/evdev.c", it see=
ms below two Hunk's are not getting reflected.

@@ -2469,7 +2478,7 @@ evdev_device_get_output(struct evdev_device *device)
const char *
evdev_device_get_sysname(struct evdev_device *device)
{
- return udev_device_get_sysname(device->udev_device);
+ return device->sysname;
}

const char *
@@ -3066,6 +3075,8 @@ evdev_device_destroy(struct evdev_device *device)
if (device->base.group)
libinput_device_group_unref(device->base.group);

+ free(device->log_prefix_name);
+ free(device->sysname);
free(device->output_name);
filter_destroy(device->pointer.filter);
libinput_timer_destroy(&device->scroll.timer);

Can you please check this from your end too? If this is the case, there is =
a serious issue where patching is failing silently which needs attention.

As I have seen the patch in the testing branch "http://cgit.openembedded.or=
g/openembedded-core-contrib/commit/?h=3Dstable/dunfell-nut&id=3D6a31bfaee4d=
715f31e69cea1eed05484d9d7a999" I considered to post this email as it seems =
you also did not get any warnings/error during the patching and even compil=
ation.

Thanks,
Ranjitsinh Rathod

--iYFtxa9YPZScnySDkaJs
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,<br /><br />It seems something is wrong with this patch and also i=
n the patching tool within Yocto as well.<br /><br />When I apply this patc=
h, it is getting applied cleanly, without any warnings and/or patch-fuzz, w=
hich means the source code should reflect as per the patch.<br />But when I=
 go to the source code on the path "build/tmp/work/&lt;architecture&gt;/lib=
input/1.15.2-r0/libinput-1.15.2" and see the file "src/evdev.c", it seems b=
elow two Hunk's are not getting reflected.<br /><br />
<div>@@ -2469,7 +2478,7 @@ evdev_device_get_output(struct evdev_device *dev=
ice)</div>
<div>&nbsp;const char *</div>
<div>&nbsp;evdev_device_get_sysname(struct evdev_device *device)</div>
<div>&nbsp;{</div>
<div>-<span style=3D"white-space: pre;"> </span>return udev_device_get_sysn=
ame(device-&gt;udev_device);</div>
<div>+<span style=3D"white-space: pre;"> </span>return device-&gt;sysname;<=
/div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;const char *</div>
<div>@@ -3066,6 +3075,8 @@ evdev_device_destroy(struct evdev_device *device=
)</div>
<div>&nbsp;<span style=3D"white-space: pre;"> </span>if (device-&gt;base.gr=
oup)</div>
<div>&nbsp;<span style=3D"white-space: pre;"> </span>libinput_device_group_=
unref(device-&gt;base.group);</div>
<div>&nbsp;</div>
<div>+<span style=3D"white-space: pre;"> </span>free(device-&gt;log_prefix_=
name);</div>
<div>+<span style=3D"white-space: pre;"> </span>free(device-&gt;sysname);</=
div>
<div>&nbsp;<span style=3D"white-space: pre;"> </span>free(device-&gt;output=
_name);</div>
<div>&nbsp;<span style=3D"white-space: pre;"> </span>filter_destroy(device-=
&gt;pointer.filter);</div>
<div>&nbsp;<span style=3D"white-space: pre;"> </span>libinput_timer_destroy=
(&amp;device-&gt;scroll.timer);<br /><br />Can you please check this from y=
our end too? If this is the case, there is a serious issue where patching i=
s failing silently which needs attention.<br /><br />As I have seen the pat=
ch in the testing branch "http://cgit.openembedded.org/openembedded-core-co=
ntrib/commit/?h=3Dstable/dunfell-nut&amp;id=3D6a31bfaee4d715f31e69cea1eed05=
484d9d7a999" I considered to post this email as it seems you also did not g=
et any warnings/error during the patching and even compilation.<br /><br />=
Thanks,<br />Ranjitsinh Rathod</div>

--iYFtxa9YPZScnySDkaJs--

