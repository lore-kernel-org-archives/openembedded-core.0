Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4917CC54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 21:19:57 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.2738.1663708790668124659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 14:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NdrpHOti;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CFE7B60002;
	Tue, 20 Sep 2022 21:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663708788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MCDHrgpHDyFV5se0YCXp6uVN6kmk/3n16I4BXpaPq8M=;
	b=NdrpHOtiXjdxN/rX1hX7wnYsWazrO9C8oYS9rrXyoK1EL7My7immJ7TvtreRSUI3S9K5+e
	UjQtcEK5+JTdhMk453n6OI2OwQkXfKmF1UeVfrHJPWwpbde11GxArSGUXl6ACurUFX7FxO
	EIsmY6LPRddnIFD/h+I41JY+QdfDUsrAZQwWZDAw0GPgqdlUU47fxdH62xfawaviPjQaux
	ocA05VDS4DlgWHEHGz2rlXXsTZWH/WpFKkeaAuvDCIdkN6ojXDXaINp3gVb7r33Y1oth7q
	ujyl0RMzentrp7vH3uZHS93OD97xsFom3CCd59G1ELT2G9VQZ0Ukd/3aDle+CA==
Date: Tue, 20 Sep 2022 23:19:47 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: robert_henz@jabil.com
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] PR to fix WantedBy parsing of systemctl
Message-ID: <Yyouc28ZITHHQlcp@mail.local>
References: 
 <b5c12365825c4ccf862a0d58029b0939DM5PR02MB221823F6928D9018544ECA3B834C9@DM5PR02MB2218.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <b5c12365825c4ccf862a0d58029b0939DM5PR02MB221823F6928D9018544ECA3B834C9@DM5PR02MB2218.namprd02.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 21:19:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170910

Hello,

On 20/09/2022 17:55:42+0000, Robert Henz via lists.openembedded.org wrote:
> Hi everyone,
> 
> I have a PR to fix the WantedBy parsing of the systemctl script. I
> tried to follow the process described in your wiki
> (https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded),
> but ran into some problems I wasn't able to figure out. I will attach
> the patch file for my suggested change to this email but I also went
> ahead and created a fork and generated a GitHub PR in case that is
> ok/easier?

This is not easier to me. However, I'm interested to know more about the
issues you couldn't solve as this is a recurring topic.


> From 6cdb207ed99bc82324fb7b85126425ac8d439070 Mon Sep 17 00:00:00 2001
> From: Bob Henz <robert_henz@jabil.com>
> Date: Mon, 19 Sep 2022 22:02:58 -0400
> Subject: [PATCH] Fix WantedBy processing
> 
> An empty string assignment to WantedBy should clear all prior WantedBy
> settings. This matches behavior of the current systemd implementation.

Your SoB is missing here and this is mandatory.

> ---
>  meta/recipes-core/systemd/systemd-systemctl/systemctl | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> index 6d19666d82..cddae75a06 100755
> --- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
> +++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> @@ -26,6 +26,9 @@ locations = list()
>  
>  class SystemdFile():
>      """Class representing a single systemd configuration file"""
> +
> +    _clearable_keys = ['WantedBy']
> +
>      def __init__(self, root, path, instance_unit_name):
>          self.sections = dict()
>          self._parse(root, path)
> @@ -80,6 +83,14 @@ class SystemdFile():
>                  v = m.group('value')
>                  if k not in section:
>                      section[k] = list()
> +
> +                # If we come across a "key=" line for a "clearable key", then
> +                # forget all preceding assignments. This works because we are
> +                # processing files in correct parse order.
> +                if k in self._clearable_keys and not v:
> +                    del section[k]
> +                    continue
> +
>                  section[k].extend(v.split())
>  
>      def get(self, section, prop):
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170905): https://lists.openembedded.org/g/openembedded-core/message/170905
> Mute This Topic: https://lists.openembedded.org/mt/93809846/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

