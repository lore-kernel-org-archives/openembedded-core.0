Return-Path: <pazhukov@suse.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC753C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 10:28:14 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by mx.groups.io with SMTP id smtpd.web10.40987.1702895287393024131
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 02:28:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=VKotku/0;
 dkim=pass header.i=@suse.de header.s=susede2_ed25519 header.b=7guIXosx;
 dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=VKotku/0;
 dkim=pass header.i=@suse.de header.s=susede2_ed25519 header.b=7guIXosx;
 spf=pass (domain: suse.de, ip: 195.135.223.130, mailfrom: pazhukov@suse.de)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A777B2208C;
	Mon, 18 Dec 2023 10:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1702895284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1GF1WdMK5TCGVko4D8y04iWzikvntprbBzMwFr+9NwE=;
	b=VKotku/0diCwjEGDxQPpzIuAQA/ZQiX9cOv38zWrGKMNbGGMV0xg7xc6CY9T9CUYlIYYR3
	KMsh7e+4pGWapOn2lzjbo0xjlMLRT+29SchJOC10v4pOPZapKsaRS3R4548ZIuyPjdp8as
	HfDNoC1V/ud/bdXf3lZCZzF9nnyJkIg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702895284;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1GF1WdMK5TCGVko4D8y04iWzikvntprbBzMwFr+9NwE=;
	b=7guIXosxZAta6y7DcMeKa+AJl1/nMl9dlmkaqGT+nwNSyLjiBqnXWXL+EoxLGR0sUpW15A
	G1/G2W64/M317lCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1702895284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1GF1WdMK5TCGVko4D8y04iWzikvntprbBzMwFr+9NwE=;
	b=VKotku/0diCwjEGDxQPpzIuAQA/ZQiX9cOv38zWrGKMNbGGMV0xg7xc6CY9T9CUYlIYYR3
	KMsh7e+4pGWapOn2lzjbo0xjlMLRT+29SchJOC10v4pOPZapKsaRS3R4548ZIuyPjdp8as
	HfDNoC1V/ud/bdXf3lZCZzF9nnyJkIg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702895284;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1GF1WdMK5TCGVko4D8y04iWzikvntprbBzMwFr+9NwE=;
	b=7guIXosxZAta6y7DcMeKa+AJl1/nMl9dlmkaqGT+nwNSyLjiBqnXWXL+EoxLGR0sUpW15A
	G1/G2W64/M317lCA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id A005F13927;
	Mon, 18 Dec 2023 10:28:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id fEXtJrQegGXEIgAAn2gu4w
	(envelope-from <pazhukov@suse.de>); Mon, 18 Dec 2023 10:28:04 +0000
MIME-Version: 1.0
Date: Mon, 18 Dec 2023 11:28:04 +0100
From: pazhukov <pazhukov@suse.de>
To: alexandre.belloni@bootlin.com
Cc: Pavel Zhukov <pavel@zhukoff.net>,
 openembedded-core@lists.openembedded.org, luca.ceresoli@bootlin.com,
 richard.purdie@linuxfoundation.org
Subject: Re: [OE-core] [PATCH v3 1/4] dummy-sdk-package.inc: Filter packages
 which are marked for installation
In-Reply-To: <20231012093603.53a79e61@booty>
References: <20231009144001.21150-1-pavel@zhukoff.net>
 <20231012093603.53a79e61@booty>
User-Agent: Roundcube Webmail
Message-ID: <b65cec4ff5d003bef56f96ffdd7ef52b@suse.de>
X-Sender: pazhukov@suse.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.13 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	 MIME_GOOD(-0.10)[text/plain];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 BAYES_HAM(-0.83)[85.16%];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from]
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="VKotku/0";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7guIXosx
X-Rspamd-Queue-Id: A777B2208C
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 10:28:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192628

Hi Alex, Luca,

Can you please retest this patchset one more time please?
Neither myself nor RP could reproduce build failure with recent
master/sstate so it might be fixed in the meantime.

-- 
Pavel

On 2023-10-12 09:36, Luca Ceresoli via lists.openembedded.org wrote:
> Hello Pavel,
> 
> On Mon,  9 Oct 2023 16:39:58 +0200
> "Pavel Zhukov" <pavel@zhukoff.net> wrote:
> 
>> if packages is provided by dummysdk and in the same time marked for
>> installation with IMAGE_INSTALL it causes conflict in apt because 
>> virtual providers are
>> not taken into account if package is asked to be installed explicitly.
>> Filter such packages from provides/conflicts to workaround this 
>> problem.
>> This workaround brakes RPM usecase because of file conlicts with
>> DUMMYPROVIDES, use DUMMYPROVIDES_PACKAGES_MULTILIB instead (which
>> doesn't include file based conflicts).
>> While this is needed for the case of package_deb only adding it for 
>> all
>> package managers to not complicate the code.
>> 
>> Fixes: [Yocto #13338] [Yocto #14066]
>> 
>> Fixes:
>> The following information may help to resolve the situation:
>> 
>> The following packages have unmet dependencies:
>>  target-sdk-provides-dummy : Conflicts: bash
>> E: Unable to correct problems, you have held broken packages.
>> 
>> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
> 
> Testing with this series applied results in lots of errors like these:
> 
> stdio: ERROR: core-image-minimal-1.0-r0 do_rootfs: No SPDX file found
> for package base-files, False
> sstate:base-files:qemux86_64-poky-linux:3.0.14:r0:qemux86_64:11:
> sstate:base-files::3.0.14:r0::11:
> stdio: ERROR: core-image-minimal-mtdutils-1.0-r0 do_rootfs: No SPDX
> file found for package base-files, False
> sstate:base-files:qemux86_64-poky-linux:3.0.14:r0:qemux86_64:11:
> sstate:base-files::3.0.14:r0::11:
> 
> See the full log at:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5894/steps/14/logs/stdio
> 
> Luca
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188989):
> https://lists.openembedded.org/g/openembedded-core/message/188989
> Mute This Topic: https://lists.openembedded.org/mt/101853406/7591736
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [pazhukov@suse.de]
> -=-=-=-=-=-=-=-=-=-=-=-

