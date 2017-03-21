Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7148E77A0B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 07:23:15 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id b140so43828149iof.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 00:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=NYzh4qD94OlXb2ClUnlDeAelKEo6TQVjJmt1af9cfoI=;
	b=kGPtVDBrL3qDMeJtgtC3m/Dzg9HlWK4KrrQ6OnJY1CbF712EsORavGAxeqW9xh/3ny
	WAu5m7xUCAt/wJICn9ejpRSMr2in/BcPTqbG5AvB8DlJvJfJFVydX4V5wFzR6B1N1iRs
	ip5mXf4MhmxVY7fTpCpKsG0INM4Pm7dzMiyHe0B5oHonCa1uzp7eJv03Ar43IxiHdiJh
	m+EeSfg6CLFwXTjVK/cLMsSYyk7GbwYDWOVJM4WhCv0v4WNB3D//WfFAz+qIkYxc2A8/
	RuQ0Sz+FaFQurFjN+mGher+zl4Qr6hjPv0SeZTDrORRLP5+l9v1x9Pyz0izKOhDp3w9B
	rYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=NYzh4qD94OlXb2ClUnlDeAelKEo6TQVjJmt1af9cfoI=;
	b=PYVzBska2er6QVBkHNgKfNDk+L2KtXwI+UC1v1QjwF5GMadnP0CJAmTbj62iipHvUh
	YXa43iCXOZxV0e4EAjMd2YrIvbQAGkKQteYwflMoRQAxMblKixmqjr7V485gdA9jEm1c
	HN8dqcMa0Ae7JmTj1H9fLfpyC4LL8aD0yhWpT3f8SRNSrhD42H4WvGidGdfX6yyvWidY
	tkwN+03EBhydXsB56Y6KOUDGMLgprJ0UEJ4lugak4kZhQPoxDAWkRJLkEL1e3I4Nb9JU
	SDs4Xizy+xLkfN/sUegsxr2rqJCZkSIwhPLdwOZV7AfMvkB8uj4OW53roXqFShbI+11T
	2W6w==
X-Gm-Message-State: AFeK/H3C016LuZmVxAqyMjfvKB9AY5559hezP5EvDCWW/QAdoUgMzDSdaph4VwFhiMLtnA==
X-Received: by 10.107.46.136 with SMTP id u8mr16434754iou.85.1490080996347;
	Tue, 21 Mar 2017 00:23:16 -0700 (PDT)
Received: from linux-uys3 (104-247-246-30.cpe.teksavvy.com. [104.247.246.30])
	by smtp.gmail.com with ESMTPSA id
	10sm6397790itm.12.2017.03.21.00.23.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Mar 2017 00:23:15 -0700 (PDT)
Date: Tue, 21 Mar 2017 03:23:13 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Martin.Jansa@gmail.com, koen@dominion.thruhere.net,
	openembedded-core@lists.openembedded.org
Message-ID: <20170321072313.GA2565@linux-uys3>
MIME-Version: 1.0
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: kernel config, scripts/setlocalversion
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
X-List-Received-Date: Tue, 21 Mar 2017 07:23:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

Currently openembedded-core/meta/classes/kernel.bbclass contains:

	kernel_do_configure() {
		# fixes extra + in /lib/modules/2.6.37+
		# $ scripts/setlocalversion . => +
		# $ make kernelversion => 2.6.37
		# $ make kernelrelease => 2.6.37+
		touch ${B}/.scmversion ${S}/.scmversion

According to the log message for this commit, the kernel's
scripts/setlocalversion was leaving and/or appending a '+' to the end of
directory names (e.g. /lib/modules/2.6.37+). The conversation can be seen
here:

	http://lists.openembedded.org/pipermail/openembedded-core/2011-December/053263.html

The problem is that creating an empty .scmversion file circumvents the kernel
build's CONFIG_LOCALVERSION handling. In other words, if the user enables this
kernel option, touching .scmversion prevents this option from having any
effect (which doesn't seem right). It seems like overkill for simply wanting
to remove a trailing '+' character.

I've been playing around with this by removing the "touch" line and in my
testing I don't see any '+' characters appended to /lib/modules in the image.
In other words, it *seems* as though the issue this commit was trying to fix
doesn't seem to be an issue anymore?

But maybe I'm not doing enough testing? Could anyone clarify the issue with
commit 56fe5300ab5?

I'd like to further point out that this only happens if/when the user enables
the kernel's CONFIG_LOCALVERSION option, and that, by default, this option is
turned off in linux-yocto* kernels.

Best regards,
	Trevor

