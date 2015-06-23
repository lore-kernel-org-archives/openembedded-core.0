Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF2E74056
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 14:35:19 +0000 (UTC)
Received: by wicgi11 with SMTP id gi11so18842964wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 07:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=U3wxlY/OtO02LLQj+KKXuMc1YjtloQToQOzxjat0lsM=;
	b=mANOdnGgueF+DADaS01zTytOUWscS+zPbE0goT6gQJAtvkmMojtTlR2PBdc03JLWYp
	T2kzA8Xpbyuipv7hrnRiPXGAORf1VP9hIz+9t+swnt3r2iJjKRuQtgdItX+mF2w9KE21
	3kfK0vZJDpPva0w5undo9exCY4WmlgHvpq4i7bbeH9zFomWNCkSJthVyctOKWcnF0FYO
	Cuo7iXYI8uoijqJR/KD6sTcbiBVdsFS9NuuM0qPyHLGIFnfD86RuP1+mdMbhJRpcs83p
	kT704bz8pLvS2pzJT4qV249jsCmZYgj5Krmz0sbhH1DfJByssWPC+B+h0z8XGS3LKE9m
	cq/Q==
X-Gm-Message-State: ALoCoQlidXFHU7pw6URHCKp3stncUj86a7rXi/XuNml1CZDH+y2m9Sna/FoDK4nnU7Pj9pgGqL4o
X-Received: by 10.180.24.40 with SMTP id r8mr4223883wif.24.1435070120203;
	Tue, 23 Jun 2015 07:35:20 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id z9sm12982900wiv.9.2015.06.23.07.35.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Jun 2015 07:35:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 15:30:01 +0100
Message-Id: <1435069807-13557-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [RFC] Move libexecdir to $prefix/libexec
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
X-List-Received-Date: Tue, 23 Jun 2015 14:35:22 -0000

Hi,

Yes, I'm bringing this up again. :)

Our default of libexecdir=$libdir/$BPN is contrary to both the FHS[1] and GNU
Coding Standards[2], mainly because the key point is that libexecdir should be
global and not change per-recipe.  The new FHS allows /usr/libexec so this
series changes the default to that, and fixes up the recipes which need fixing.

Several of the recipe fixes are unrelated to the change and will be submitted to
master shortly, but others (eg sudo) are intimately tied to the change.

I've done basic multilib-enabled builds but more testing welcome.  I'd say that
in general multilib problems this exposes are in fact problems with the recipe:
for example GConf should install the binaries once and libraries in each libdir.

Ross

[1] http://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch04s07.html
[2] https://www.gnu.org/prep/standards/html_node/Directory-Variables.html


