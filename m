Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46F1CDB482
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 08:21:38 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.34045.1697185297176611799
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 01:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Pejd/x05;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=W+436H1Y8OJt/v6zc6iZfdCfEe9IP6HxOUBuckkkdIE=; b=Pejd/x05cKkbmpLcT5NoN/FfSC
	KK2Ikg8ZkntzlG3MLIH3y6FfE4geAQi0bnTOn288fKMNGG/j9dwgVck4W+imont/m4GqHYtVyo/Zf
	H3tKxP6kjpPG2rvti2C3AcQkWvNdzR80FyWjXUIInpSrY4jUo5OAXCRjIUUG3806V/Q6xedZzwLeN
	X4pcpVY9iqgNab0SA3eIagqDydbRWMk2LI1wnrknO+h865IWk8QAygDzQSod6iOLMz80QHBFRl5hS
	GzS+SAO6eDw/lFq+hrr0iC40nYdtsUr3K+fyM2WoHdBT9fs7jKepKiSmBYkJzq7Uh8eqtMtr5ffJC
	lVSu8HCg==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:53494 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qrDQG-00AqkD-38
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Oct 2023 04:21:35 -0400
Date: Fri, 13 Oct 2023 04:21:21 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: why does rust recipe file define "rust_do_install()"?
Message-ID: <b4caf8ff-c5e6-69c6-bcaa-8caa659a2220@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 08:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189029


  i'm perusing the rust_1.70.0.bb recipe file, and i'm puzzled by the
fact that it defines its own do_install() to simply call
rust_do_install(), which then implements variations of that function:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/rust/rust_1.70.0.bb#n244

  do_install () {
    rust_do_install
  }

  rust_do_install() {
    rust_runx install
  }

  rust_do_install:class-nativesdk() {
    export PSEUDO_UNLOAD=1
    rust_runx install
    rust_runx install clippy
    ... snip ...

i'm familiar with bbclass files defining things like that; eg.,
autotools.bbclass defining:

  autotools_do_install() {
        oe_runmake 'DESTDIR=${D}' install it if it exists.
        if [ -e "${D}${infodir}/dir" ]; then
                rm -f ${D}${infodir}/dir
        fi
  }

but examples like that are generally then listed in EXPORT_FUNCTIONS
so subsequent recipes can invoke them as part of *their* do_install(),
like this snippet from the tar recipe:

  do_install () {
    autotools_do_install
    ln -s tar ${D}${bindir}/gtar
  }

but i'm not sure why the rust recipe file is doing what it's doing.
could it not have just defined variations of do_install() and gotten
the same effect? or is there something more subtle happening here?

rday

