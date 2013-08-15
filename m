Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id CFA016B834
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 09:43:16 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V9u5N-0002wZ-8z; Thu, 15 Aug 2013 11:43:17 +0200
Message-ID: <1376559796.17787.14.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: wenzong fan <wenzong.fan@windriver.com>
Date: Thu, 15 Aug 2013 10:43:16 +0100
In-Reply-To: <520C9F8A.7080703@windriver.com>
References: <520C9F8A.7080703@windriver.com>
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: About PACKAGECONFIG audit
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
X-List-Received-Date: Thu, 15 Aug 2013 09:43:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-08-15 at 17:29 +0800, wenzong fan wrote:
> Or could we run this check as part of a QA build step?

I think that could be done, in principle.  Now that "ld
--no-copy-dt-needed-entries" is the default, there's no reason that the
shlibs code in package.bbclass couldn't be taught to verify that all the
shared library providers it identifies come from recipes that are listed
in DEPENDS.  

The only difficulty is that you'd need to accept DEPENDS-of-DEPENDS
(e.g. a recipe which DEPENDS on gtk+ but also links with libatk or
something) and I don't think there's currently any straightforward way
for package.bbclass to generate the recursive dependency chain for an
arbitrary recipe.  An easy if inelegant workaround would be for it to
just stash the value of ${DEPENDS} along with the other shlibs data that
it writes out for each provider.

p.



