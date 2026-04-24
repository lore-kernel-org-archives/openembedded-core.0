Return-Path: <patrick.vogelaar.dev@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDDDFED3F0
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 16:18:00 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26748.1777047477105305094
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 09:17:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=TEiq1441;
 spf=pass (domain: mailbox.org, ip: 80.241.56.161, mailfrom: patrick.vogelaar.dev@mailbox.org)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g2J5r4HYQz9spW;
	Fri, 24 Apr 2026 18:17:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777047472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ChbEfrmPyBUmZmhc7tHcWCQWPkkRHP53P17bIR/h6HM=;
	b=TEiq1441YWlu+FKZyHwD+0Dqxj8AuhOGAH6N74BrNEf0M7aWQ74DEkcy1Q+I6sOB4u4C8Y
	qpEzfG6Y+aa5cxqwSH0lPiYF1zbQO4+RdWTmaqdhoICdBt64TmjOkY5E9TYeEslcNFrtPK
	DRpyfW6fddxEwE47A4TjYJVgIHa3GvvWKNY3Gd9HsBIeCnsL2/i0VtG+STu5ildyGX7DYm
	kPrGFz2+OmYjCWPL5USFnkr/koqed7/srgkKlDxuAYcfrjUz+BNAfm5mEvKACHo8EsAR7L
	gx1ZlJi+fj3vNX8pB8Lu2YE8Eb5+1LSW6H7vh3DmVedjq6fXInt65P2rddcVyA==
Date: Fri, 24 Apr 2026 18:17:51 +0200 (CEST)
From: patrick.vogelaar.dev@mailbox.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Message-ID: <385919975.284796.1777047471445@app.mailbox.org>
In-Reply-To: <CANNYZj-O2OXqe4JnHhnP1D9ETtmWgwPt+D-hJ+YQ=XheMietYw@mail.gmail.com>
References: <711678500.248994.1777008574252@app.mailbox.org>
 <CANNYZj-O2OXqe4JnHhnP1D9ETtmWgwPt+D-hJ+YQ=XheMietYw@mail.gmail.com>
Subject: Re: [OE-core] DPKG Issue - guidance neede
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-MBO-RS-META: mgn61nhaaos6johztqawsx71u64fioa3
X-MBO-RS-ID: 793410fc6dc67cc031b
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 16:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235871

Hi Alex,

>  
> You need to explain why the directory has permissions that don't allow
> you to access it. What is the workflow that causes this? Typically
> anything in a build directory is built by the user themselves, and
> taking a build from another user and reusing it is not supported.
> Sstate cache is the correct mechanism to share build output.
> 

Yes, we are using the sstate cache to share the build. Our CI is providing its sstate cache to the developers. The Point is that DPKG compiles in the path of the dpkg config dir into the binary (see [1]). If it does not find this directory (ENOENT) it fails silently. And I guess this is what happens for nearly everybody that uses dpkg-native from a shared sstate cache. So there is no error and it works.

On the CI the build directory is located under /var/jenkins_home/.../build. This means that CONFIGDIR is set to ${sysconfdir}/dpkg which ends up in the binary

But unluckily we had the case that some devs had the directory /var/jenkins_home on their machines present but with permissions not accessible by the build user. Now dpkg-native does not receive a ENOENT but EACCES which does not fail silently anymore and we have shown error message.


For me it is not clear where I should provide a fix or bug report to. Is it:
1. a problem of the sstate cache mechanism because it cannot handle compiled in paths?
2. a problem of the recipe because that path should not go into the binary or be configurable (which would also mean a change in the dpkg source)
3. a problem of dpkg that it should treat EACCES the same as ENOENT or make the config dir configurable as a runtime option. (But I guess that I would need to discuss with the DPKG project)


[1] https://github.com/guillemj/dpkg/blob/1.22.0/lib/dpkg/options.c#L162-L178

Patrick

> 
> Alex
> 
> On Fri, 24 Apr 2026 at 07:29, Patrick Vogelaar via
> lists.openembedded.org
> <patrick.vogelaar.dev=mailbox.org@lists.openembedded.org> wrote:
> >
> > Hi all,
> >
> > we are building a custom distribution and are using a shared sstate cache. Now we discovered an edge case where it causes problems if parts of the CIs build path exist but is not accessible due to permissions.
> >
> > Build path CI: /var/jenkins_home/.../build
> >
> > If now on my local machine the directory /var/jenkins_home exists but is not accessible due to permissions the build fails in do_rootfs with:
> > dpkg: error: error opening configuration directory '/var/jenkins_home/.../build/tmp/.../recipe-sysroot-native/etc/dpkg/dpkg.cfg.d': Permission denied
> >
> > If this directory does not exist dpkg fails silent and there is no problem at all. But if it cannot access it because of permissions it throws an error.
> >
> > What would the workflow now be?
> > Provide a patch to the dpkg project and also add the patch to the recipe? or something else?
> > Should I create a bugzilla issue?
> > ...
> >
> > Would be great to get some support on the typical next steps.
> >
> > Thanks for the guidance
> > Patrick
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#235836): https://lists.openembedded.org/g/openembedded-core/message/235836
> > Mute This Topic: https://lists.openembedded.org/mt/118983534/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

