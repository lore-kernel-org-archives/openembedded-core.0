Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3AECF395B
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 15:01:04 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.22118.1726758060870708026
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 08:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TPkhDkAt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4A401C000F;
	Thu, 19 Sep 2024 15:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726758059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9G0msv+tAt4Z4h7YZX7NQsffsxg7X6FkFdWY1LdLEnA=;
	b=TPkhDkAtNl5IGIY3BjhLZRAweXlJEHmmnxkVxsMZjmeLnW9Q3ErAJx9eGajRAKgVTZAwkR
	U8FBBgVhqwS3kvXgi3C46eBPlcDhVCy+0loC4uF/qQ1v6Z9kWygeYwEhkaSoNcx0sJoO+E
	PxG/9xvXeeqL/uuPDzNcaOFhNerFhMwULRY0RkTPHOOo+ouuGFdB+9ha19ch7JrubV8LcK
	EfFgitWO5k4hD7gsIH7ENjdim4278hZYDYH/XMWdnWoVbFXqcLGn4Xw/JCXfoR19v7Uq8d
	0LLHdMD/j6zZViBMu3gQkqRb8noVGty2ywCEX4ean/iH9VbbPVK0VM76WCxIhw==
Date: Thu, 19 Sep 2024 17:00:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Openembedded-core@lists.openembedded.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steve Sakoman <steve@sakoman.com>
Subject: Re: [OE-core] [PATCH 2/2] oeqa/postactions: do not uncompress
 retrieved archive on host
Message-ID: <20240919150054634aadd3@mail.local>
References: <20240812151404.134030-1-alexis.lothore@bootlin.com>
 <20240812151404.134030-3-alexis.lothore@bootlin.com>
 <17F6955C7A69DDF6.31299@lists.openembedded.org>
 <7a062edc9676b801da41ea875a7a4e82267a751f.camel@linuxfoundation.org>
 <f2d9c941-46f9-410d-84a0-f1861b6e1418@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2d9c941-46f9-410d-84a0-f1861b6e1418@bootlin.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 15:01:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204706

On 19/09/2024 16:29:06+0200, Alexis Lothor� wrote:
> Hello Richard,
> 
> On 9/19/24 14:58, Richard Purdie wrote:
> > On Thu, 2024-09-19 at 08:42 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> >> On Mon, 2024-08-12 at 17:14 +0200, Alexis Lothor� via
> >> lists.openembedded.org wrote:
> >>> From: Alexis Lothor� <alexis.lothore@bootlin.com>
> 
> [...]
> 
> >>> --- a/meta/lib/oeqa/utils/postactions.py
> >>> +++ b/meta/lib/oeqa/utils/postactions.py
> >>> @@ -68,7 +68,8 @@ def list_and_fetch_failed_tests_artifacts(d, tc,
> >>> artifacts_list, outputdir):
> >>> �������� (status, output) = tc.target.run(cmd, raw = True)
> >>> �������� if status != 0 or not output:
> >>> ������������ raise Exception("Error while fetching compressed
> >>> artifacts")
> >>> -������� p = subprocess.run(["tar", "zxf", "-", "-C", outputdir],
> >>> input=output)
> >>> +������� with open(archive_name, "wb") as f:
> >>> +����������� f.write(output)
> >>> ���� except Exception as e:
> >>> �������� bb.warn(f"Can not retrieve artifacts from test target:
> >>> {e}")
> >>
> >>
> >> This change is causing failures since archive_name isn't defined
> >> anywhere :/
> > 
> > I'd also note that scarthgap actually throws errors:
> > 
> > https://valkyrie.yoctoproject.org/#/builders/73/builds/135/steps/12/logs/stdio
> > 
> > Exception: NameError: name 'artifact_path' is not defined
> > 
> > which is related to some of these patches :/.
> 
> I am out of  office right now with limited access to computer (I come back next
> week but then I will be traveling to attend Kernel Recipes). If no one fixes it
> before, I'll take a look and send a fix once I return to the office (end of next
> week)
> 

Mathieu is going to take care of this tomorrow/beginning of next week.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

