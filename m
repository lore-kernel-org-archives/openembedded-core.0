Return-Path: <patrick.ohly@intel.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3615378231
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 05:57:11 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id 123so79761976pgj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 22:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=xm06xKy0U0mzVcjwUnpDNWCrXAZO/fbQF08QyoVYELA=;
	b=FeR+/m8GK6mrohUsesYCnTQhFGsPRtHU50fpeX6JX8+oiS0yGQEgIceHDo7SkjlXPC
	IWSrfpeBs3geJFD5WPP03Pq8hBBSNJaLI8Kss2bHTUevu9iEnjgHda5dLzpx1QpJsK7q
	dJztI8Pf9BPfQyAsg5U7SyAIIET/5/uQY50EySy73TtWUemKBP1rPP9UQe+dGO4WywDj
	NrWTXEE1Lg30MzZGWHyp3asVbeRJWhACkRsLQ1lA69+0mXOXfxzOnm+zl3O4Rw0TB+lZ
	yTY3B5YoVy6da2Z8v2DKuxHeYM820iJYfpCw5H/0Ygv0EY3DJzFizsrTBiIflkpeU7fL
	Gm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=xm06xKy0U0mzVcjwUnpDNWCrXAZO/fbQF08QyoVYELA=;
	b=WhuOOP4r4hdxqlqyFlB4TvFazUAvlCcsPcF29UksqsTDECigRwT6S8NsWA6GDDsl9S
	29yjkLj16Tt/uX24WCGVHzjtTMEtJj3JaN+NTp86deFZ5E/hk5aUmZuQycWGy+QThKVY
	6yuR3GWky5kmdVmVDTpEuODLXAQWhk2kW6lJY3h7Lrhn187cX/mwtvZKgEjqOdfUPGjR
	PDMxP+M6lvQdp+9ufzYPoOxbpR9nUxprbrtRJeFbpQQzseoWMPX37b4E0h8SnPBgjo19
	yE2vog+Qbhr85jAjaSc0o4w2GwLBFZCZt36EVYWjL5jhrcCLQIfliyiZuaCordCXlgo9
	Ch9w==
X-Gm-Message-State: AIVw111j2O1irZINEHr5pBqP22R+CpkJkeisATkJYDdpnS2StmFVFTla
	2jB93oXyIraW7d1ZBQg=
X-Received: by 10.98.217.210 with SMTP id b79mr21710850pfl.297.1501048633253; 
	Tue, 25 Jul 2017 22:57:13 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8E0C9.dip0.t-ipconnect.de. [93.232.224.201])
	by smtp.gmail.com with ESMTPSA id
	s15sm29493034pfk.42.2017.07.25.22.57.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 25 Jul 2017 22:57:12 -0700 (PDT)
Message-ID: <1501048626.26603.23.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Tom Rini <trini@konsulko.com>, openembedded-core@lists.openembedded.org
Date: Wed, 26 Jul 2017 07:57:06 +0200
In-Reply-To: <1501012689-2574-1-git-send-email-trini@konsulko.com>
References: <1501012689-2574-1-git-send-email-trini@konsulko.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH] image: Fix "metadata is not deterministic" when chaining 2+ CONVERSION_CMDs
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
X-List-Received-Date: Wed, 26 Jul 2017 05:57:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-07-25 at 15:58 -0400, Tom Rini wrote:
> When we have more than one CONVERSION_CMD being used, for example
> ext4.gz.sha256sum we will see errors about "metadata is not
> deterministic".  This is because we do not have a stable order of
> intermediate files that will be removed in the generated shell
> command.
> We fix this by calling sorted() on the set of rm_tmp_images so that
> we
> will have a stable hash again.
> 
> Cc: Patrick Ohly <patrick.ohly@intel.com>
> Signed-off-by: Tom Rini <trini@konsulko.com>

Acked-by: Patrick Ohly <patrick.ohly@intel.com>

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



