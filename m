Return-Path: <Markus.Niebel@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B77C636FB
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:01 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web09.30481.1649689597298084038
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 08:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@tq-group.com header.s=key1
 header.b=PlSPk4ea;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81,
 mailfrom: markus.niebel@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1649689597; x=1681225597;
  h=message-id:subject:from:to:date:mime-version:
   content-transfer-encoding;
  bh=S7VeLQvMg9aFJEXvAtyq1xzB8m/nKUSX6KS7VjLT45A=;
  b=PlSPk4eaNsiJaYt1vhFloSFyg/H+zZGoo8ip1KiUjNZNnTOmkIAJjvh1
   c9OzLUakJ4v0Tx5c/vFPpmhu+Wc2aRWGzvQSAbNTn0xCIF12Lqo4UCzVy
   WSxmzO4V+qKHesAMclw+M77FViVoWYsM1E+AkQvhmKgmC/gCu5fHSq9tm
   /99cP6DV4DU2V4vMsOFoj14q1HswbFkIuPQsN+bdT7R+25H65qkxtRxuL
   h0UjA+aa8F/NV5BaehSrYYF2bE+wTsTwuTuOKt2fR69c8J8sPhEY0eFrN
   SYRVic7ZqFifHnpMddGJ5DH7Aqqgsl/G3eEmV/d/gTlL6w38Le2dnri34
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,252,1643670000";
   d="scan'208";a="23227320"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 11 Apr 2022 17:06:33 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 11 Apr 2022 17:06:33 +0200
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Mon, 11 Apr 2022 17:06:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1649689593; x=1681225593;
  h=message-id:subject:from:to:date:mime-version:
   content-transfer-encoding;
  bh=S7VeLQvMg9aFJEXvAtyq1xzB8m/nKUSX6KS7VjLT45A=;
  b=PjQCONOa2Bxnl7n/RF4JXHHr1kCT3oQL+2hy48CURFZpQ31xsQFVW4Xl
   wqYXimlAFZ9FZaO7AYRr124iDYVEkK++npyCrFvDpoVEP9YZTa77opKNi
   r+XmI6J81pkdeogXNo+Vcpoxj2fyNzos+hwtzwtsjCcD86Uiq/miqKzn4
   ewSyKQDkNZlR6etODscPlvc5BqkLcJ0ha/MkPlmJPWO7+G7bdIBF8es7x
   BIw7/mKQcz79Ut0H6GijJQ1l1y7PJUh9qj0FURdYq5KvaWP7++zsp0kS1
   wQiOHygIG6pNYiZWuSmX48+jOzJ5OKwBN4azITXiwUJVgSSYbDTaZEHM1
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,252,1643670000";
   d="scan'208";a="23227319"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Apr 2022 17:06:33 +0200
Received: from niebel-ws (unknown [10.123.49.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8C2FA280070
	for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 17:06:33 +0200 (CEST)
Message-ID: <2d083c9ebada9a9ee8eaf9c97f3ef3171bdb2356.camel@ew.tq-group.com>
Subject: bitbake.conf: reason for assignment of deprecated variable
From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Apr 2022 17:06:31 +0200
Organization: TQ Systems GmbH
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164228

Hello,

with the deprecation of SERIAL_CONSOLE the following was introduced in bitbake.conf:

3f0d665384e6d1b7aa2854a9cc4f13e0961bacb7 (bitbake.conf: set SERIAL_CONSOLES from
SERIAL_CONSOLE by default)

Since this is done after inclusion of local.conf and <machine>.conf any weak default
done for a System-on-Module / CPU will be overwritten. Is this just by forgetting to
remove these lines after the deprecation or is there still a reason to keep this as
is?

Thank you

Markus Niebel



