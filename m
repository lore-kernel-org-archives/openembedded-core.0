Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE36C3DA59
	for <webhook@archiver.kernel.org>; Sat, 20 Jul 2024 13:12:44 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.5797.1721481158263994092
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jul 2024 06:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout06.t-online.de (Postfix) with SMTP id 9FC7780F;
	Sat, 20 Jul 2024 15:12:35 +0200 (CEST)
Received: from [192.168.178.67] ([84.154.170.18]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sV9t0-04IjRI0; Sat, 20 Jul 2024 15:12:30 +0200
Date: Sat, 20 Jul 2024 15:13:27 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] mesa: update 24.0.7 -> 24.1.4
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <FEBXGS.KNKG6FKVWFHG3@t-online.de>
In-Reply-To: <e60b141e96810107ceda0be06d4a084f0ff0fd88.camel@linuxfoundation.org>
References: <20240719081047.2382310-1-f_l_k@t-online.de>
	<e60b141e96810107ceda0be06d4a084f0ff0fd88.camel@linuxfoundation.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-ONNPiP6rkmqqvmyTxkCZ"
X-TOI-EXPURGATEID: 150726::1721481150-E27FFA3B-83DEE402/0/0 CLEAN NORMAL
X-TOI-MSGID: fd022e53-3912-462c-9e82-4bf98ba53059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 13:12:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202287

--=-ONNPiP6rkmqqvmyTxkCZ
Content-Type: text/plain; charset=us-ascii; format=flowed

I had a look. libclc dependency becomes mandatory once 'iris' is in 
gallium drivers or 'intel' is in vulkan drivers. It would also be 
included for gallium-asahi, but that is not enabled by default.
iris gallium driver is built by default and vulkan depends on 
DISTRO_FEATURE

This makes libclc required for quite a few common drivers now.

What would be the desired way to go here?
Make vulkan dependent on opencl and additionally dont build 
gallium-iris by default?
Or make libclc a requirement for mesa?

On Sat, Jul 20 2024 at 12:04:04 PM +01:00:00, Richard Purdie 
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2024-07-19 at 10:10 +0200, Markus Volk via
> lists.openembedded.org wrote:
>>   - Remove two patches that have been merged upstream
>>   - Remove 0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
>>     Upstream managed to fix this:
>> 
>>  
>> <https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/meson.build?ref_type=heads#L839>
>>   - Drop OPENCL_NATIVE since the according option has been removed
>>  from meson_options.txt
>>   - Update 0001-freedreno-don-t-encode-build-path-into-binaries.patch
> 
> <https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/9096/steps/12/logs/stdio>
> 
> (and lots more in that parent build)
> 
> Maybe the option was removed as it probably became mandatory? :/
> 
> Cheers,
> 
> Richard
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202276): 
> <https://lists.openembedded.org/g/openembedded-core/message/202276>
> Mute This Topic: <https://lists.openembedded.org/mt/107431781/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-ONNPiP6rkmqqvmyTxkCZ
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>I had a look. libclc dependency becomes mandatory once 'iris' is in gallium drivers or 'intel' is in vulkan drivers. It would also be included for gallium-asahi, but that is not enabled by default.&nbsp;</div><div>iris gallium driver is built by default and vulkan depends on DISTRO_FEATURE</div><div><br></div><div>This makes libclc required for quite a few common drivers now.</div><div><br></div><div>What would be the desired way to go here?</div><div>Make vulkan dependent on opencl and additionally dont build gallium-iris by default?</div><div>Or make libclc a requirement for mesa?</div></div><div id="geary-quote" dir="auto"><br>On Sat, Jul 20 2024 at 12:04:04 PM +01:00:00, Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">On Fri, 2024-07-19 at 10:10 +0200, Markus Volk via
lists.openembedded.org wrote:
<blockquote> &nbsp;- Remove two patches that have been merged upstream
 &nbsp;- Remove 0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
 &nbsp;&nbsp; Upstream managed to fix this:
 &nbsp;&nbsp;
 <a href="https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/meson.build?ref_type=heads#L839">https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/meson.build?ref_type=heads#L839</a>
 &nbsp;- Drop OPENCL_NATIVE since the according option has been removed
 from meson_options.txt
 &nbsp;- Update 0001-freedreno-don-t-encode-build-path-into-binaries.patch
</blockquote>
<a href="https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/9096/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/9096/steps/12/logs/stdio</a>

(and lots more in that parent build)

Maybe the option was removed as it probably became mandatory? :/

Cheers,

Richard
</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#202276): <a href="https://lists.openembedded.org/g/openembedded-core/message/202276">https://lists.openembedded.org/g/openembedded-core/message/202276</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/107431781/3618223">https://lists.openembedded.org/mt/107431781/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-ONNPiP6rkmqqvmyTxkCZ--


