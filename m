Return-Path: <prvs=12357d6673=holzmayr@rsi-elektrotechnik.de>
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
	[81.169.146.219])
	by mail.openembedded.org (Postfix) with ESMTP id DDD1877640
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 10:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1488537921;
	l=1607; s=domk; d=rsi-elektrotechnik.de;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
	Date:From:References:To:Subject;
	bh=+l3qbsxroOXlfv/bmEWNZHLcRyU3cTHLTe+KkdtRnbk=;
	b=UHve8TfDF79T8fBVzhe2BtBAxdbQbbtlunCzA8pTkSfyM2m3N2jy8J1fXcgRBnESJg
	IKntaF/HcPJwA1ooNdtU000lmoyMfDrguSOE86s7ch0d6IrSHF3xR/8WJpfsyQGsbFXV
	YI5Vrq0TBfDvR8yxe/QSU0EL1M9+UW5ny/x0I=
X-RZG-AUTH: :fz5RJhWIaexwuXGosGLfiBc0xYyi1Y5bd+wRKqrzPWwJyH/ODuV4n+N26eC0MVrEDIlpLg0lWA==
X-RZG-CLASS-ID: mo00
Received: from mail.rsi-elektrotechnik.de (p50933415.dip0.t-ipconnect.de
	[80.147.52.21]) by smtp.strato.de (RZmta 39.13 AUTH)
	with ESMTPSA id q00eedt23AjKYVY
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve secp384r1
	with 384 ECDH bits, eq. 7680 bits RSA))
	(Client did not present a certificate);
	Fri, 3 Mar 2017 11:45:20 +0100 (CET)
Received: from [x.x.x.x] by mail.rsi-elektrotechnik.de (Cipher
	TLSv1.2:AES-SHA:256) (MDaemon PRO v16.5.2) 
	with ESMTPSA id md50000506617.msg; Fri, 03 Mar 2017 11:45:09 +0100
X-Spam-Processed: mail.rsi-elektrotechnik.de, Fri, 03 Mar 2017 11:45:09 +0100
	(not processed: message from trusted or authenticated source)
X-MDRemoteIP: 80.147.52.21
X-MDArrival-Date: Fri, 03 Mar 2017 11:45:09 +0100
X-Authenticated-Sender: holzmayr@rsi-elektrotechnik.de
X-Return-Path: prvs=12357d6673=holzmayr@rsi-elektrotechnik.de
X-Envelope-From: holzmayr@rsi-elektrotechnik.de
X-CAV-Result: skipped - holzmayr@rsi-elektrotechnik.de is in exclusion list
To: Trevor Woerner <twoerner@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20170228045004.GA5913@linux-uys3>
From: Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>
Message-ID: <b7a65c18-be64-8689-131d-c06b0aeb3b2a@rsi-elektrotechnik.de>
Date: Fri, 3 Mar 2017 11:45:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20170228045004.GA5913@linux-uys3>
Subject: Re: npm thoughts
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
X-List-Received-Date: Fri, 03 Mar 2017 10:45:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Additional packaging/dependency thoughts:

Using the devtool mechanism to create a recipe basically packs up all 
dependencies. While this is a relatively easy solution to make sure that 
the resulting package is functional, I can see some issues:
- Dependency tracking via bitbake is virtually nonexistent. How would 
one package a npm thing to use other, already packaged dependencies?
- I see problems in the reproductibility of the builds when relying on 
npmjs as upstream server. Packages come and go there sometimes. Is there 
a way to redirect dependencies to a custom hosted mirror?
- Given the current situation, the best practise seems to be to have 
package.json take care of the needed modules, and have it handle that. 
Means in my opinion that there should be as little npm-based stuff 
installed as possible. Exactly one, in the optimal case. Downside: this 
means a second dependency tracking is layered under bitbake. No good 
that sounds....

my $.02
-- 
Josef Holzmayr
Software Developer Embedded Systems

Tel: +49 8444 9204-48
Fax: +49 8444 9204-50

R-S-I Elektrotechnik GmbH & Co. KG
Woelkestrasse 11
D-85301 Schweitenkirchen
www.rsi-elektrotechnik.de
———————————————
Amtsgericht Ingolstadt – GmbH: HRB 191328 – KG: HRA 170393
Geschäftsführer: Dr.-Ing. Michael Sorg, Dipl.-Ing. Franz Sorg
Ust-IdNr: DE 128592548

_____________________________________________________________
Amtsgericht Ingolstadt - GmbH: HRB 191328 - KG: HRA 170363
Geschäftsführer: Dr.-Ing. Michael Sorg, Dipl.-Ing. Franz Sorg
USt-IdNr.: DE 128592548


