Return-Path: <matt@madison.systems>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 14BC077EA5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 16:01:31 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id r68so6470994pfj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Oct 2017 09:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=VizCCOF4IjuvXAIOzuVw63JZHwAnZi716rlqgYaaMwY=;
	b=DRRWsIzy6+j4WUB5xcC40NpwtmNsyTED/9fB4QSEumpVQROBjOJxlZq6d7mr7gr3n8
	ZL/cjviz9VRGU1X6rlst8OejW3uV98fDZfzhtrJmKFxB+Di4LUsRHMWmnZzEW63WizEm
	fFcwxNJ1F1Sf4AmbBQ5e9zgUuNREwGWw/4iOhZIwerjXyXZV5cYcBnG0Su+iTpvIzlMo
	znYkzJGgdiUq1Kck3P8JoXqcSmMGaen7SnSe/JuAUwoAui/UMn/BQ/cQmQ4RinDxfv0x
	BcCL07YFFgsCDmFRxRx9QOT78lZIw2PVhWQyJxCJKKSD0IVHlqjBi4azaC53dZ/mcdMF
	r23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VizCCOF4IjuvXAIOzuVw63JZHwAnZi716rlqgYaaMwY=;
	b=NJ+i3xheibTiB0UMGwJl9G0pMPLclVHDAG9aBK7OKC7hky7oRanDZnRH06s5OHik9E
	eoZgerBZ9lf8Y/6cyvWbImzZ00kXNeXoaS5Uf7OaTLrhg8INHNDntfWo7/H5o64KTmfT
	w04ATSsBn0MaW46ul880hat5Ow6rOO9YLfQdepsg59c3PVs2xbtHJ4wbwcRYN7ScuJBV
	hMNXL4wvVZ27nSZ4Hiq0WvGHOHgVqG8feguzzEqazna9j0yosR30aROwubQFNQMROqQp
	z/WMYffDCz/CM36xy0opzy5PgZhRycd2x9A2k7167HTAW+XN5bKegy3EmjB+Va6Uc+Dt
	WmRQ==
X-Gm-Message-State: AHPjjUj9XB8pY+FPVtqTiHnli/4fJmXHmo6Eehxp07jcu8ZHRUxpq8Mv
	H/FdjIaLpU8p/faij6HaoeAixK2c
X-Google-Smtp-Source: AOwi7QA6NMVZO89U7XkCKRcRuBb5UjLSeH3kg5+wW3YfeDmZM4zkVQe3qeM0VxjRxKWKtLt/RtnHMQ==
X-Received: by 10.99.164.81 with SMTP id c17mr19287697pgp.445.1507132892448;
	Wed, 04 Oct 2017 09:01:32 -0700 (PDT)
Received: from ip-172-31-4-49.us-west-2.compute.internal
	(ec2-34-214-157-19.us-west-2.compute.amazonaws.com. [34.214.157.19])
	by smtp.gmail.com with ESMTPSA id
	z78sm26762491pfd.178.2017.10.04.09.01.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Oct 2017 09:01:31 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Oct 2017 16:01:14 +0000
Message-Id: <1507132875-29155-1-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
Cc: otavio@ossystems.com.br, saul.wold@intel.com
Subject: [PATCH v2 0/1] updated go-runtime patch for musl builds
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
X-List-Received-Date: Wed, 04 Oct 2017 16:01:32 -0000

Updated patch for fixing go builds for musl with x86-64
targets.

New in v2:
  * Remove runtime support for go's race detector for
    musl targets.  Go includes pre-built binaries for
    this, which are built against glibc and lead to
    linker errors for the missing glibc symbols.

Matt Madison (1):
  go-runtime: prevent host leakage into target objects

 meta/recipes-devtools/go/go-runtime.inc | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

-- 
2.7.4


