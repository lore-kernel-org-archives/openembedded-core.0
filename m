Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 271FA6C6C5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 13:55:24 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id k14so1747326wgh.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 06:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=aU1MJr4qaC8+byOEzy22NgCOxxcbfS13KnSobV8722A=;
	b=MPZ5w6MQpsC+ZNflepFwk88zifcYUA2wjv5BHeB/cEcX0Gte5gr6irxgw77IFgQKki
	54gxyE6vWksqc0kq0oYTKSYKGM8piH/L5scBeCHo0dqGMIKKfX1wmLMEgQNWGxuXxEUH
	aHUR/wZV1S8YxPvtlsnNBPsHeLFw0AACHU4/Bc19ctlWb3kR/KI4uAuVQUaYRBGIrTV8
	+gkD52yaLhmwFNZ0CNxCkTaSD0LuCHieL6Nv1znnzzPS32e5tmVbl4Fl/PiFmu+hk3lI
	cT+791JuUU22sQNrPRy6yBplSRbzOlJk2VUNwsgdK5s1LVsz8XuFx6fcNL5wECSuFyeu
	zGFQ==
X-Gm-Message-State: ALoCoQmV0CxbDv0Qu6J1ZDTZZ94gvNU8j7Tqc/HvAtoB6obZi6hjIpxVq4IBlbCPoAwglcKlxXse
X-Received: by 10.194.24.168 with SMTP id v8mr7164058wjf.28.1378389325977;
	Thu, 05 Sep 2013 06:55:25 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id b11sm5748994wik.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 06:55:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2013 14:55:20 +0100
Message-Id: <1378389321-28598-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [RFC][PATCH] insane: configure option checking
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
X-List-Received-Date: Thu, 05 Sep 2013 13:55:25 -0000

Hi,

First: very much a RFC, this isn't ready for merging.  I thought I'd send it
before it got lost in a nest of branches.

This is a small sanity test I've been poking at in between builds to detect when
configure warns that it has been passed configure options it doesn't recongise.
It's got a whitelist for options such as --disable-silent-rules that are passed
blindly to large numbers of recipes, and I think we'll need the possibility of a
per-recipe whitelist in case they are required[1].

Comments/improvements welcome!

Ross

[1] The rationale here being the Xorg protocol recipes which have a common .inc
that disables all forms of documentation, but not every protocol recipe has all
forms enabled.

