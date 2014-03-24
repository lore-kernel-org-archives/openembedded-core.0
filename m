Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id CB7856FA90
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 15:08:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2OF85Bm031081; Mon, 24 Mar 2014 15:08:05 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uNLfBzvzuV4D; Mon, 24 Mar 2014 15:08:05 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2OF80ko031077
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 24 Mar 2014 15:08:02 GMT
Message-ID: <1395673674.24890.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Mon, 24 Mar 2014 15:07:54 +0000
In-Reply-To: <53303FAB.5020907@dresearch-fe.de>
References: <5330220F.8050504@dresearch-fe.de>
	<1395664516.24232.56.camel@ted> <533029C5.1000406@dresearch-fe.de>
	<1395665593.24232.58.camel@ted> <53303FAB.5020907@dresearch-fe.de>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: complex versioning scenario
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
X-List-Received-Date: Mon, 24 Mar 2014 15:08:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-03-24 at 15:22 +0100, Steffen Sledz wrote:
> On 24.03.2014 13:53, Richard Purdie wrote:
> > On Mon, 2014-03-24 at 13:49 +0100, Steffen Sledz wrote:
> >> On 24.03.2014 13:35, Richard Purdie wrote:
> >>> On Mon, 2014-03-24 at 13:16 +0100, Steffen Sledz wrote:
> > debian.bbclass (debian package naming) which I believe in turn is
> > derived from the actual library version.
> > 
> > Its a class specific implementation so you can't depend on it in version
> > information though.
> 
> But where does it come from? A bb variable?

Read debian.bbclass. It does objdump -p and looks at the SONAME in the
output.

> 
> > I still think your only solution here is to inject a real version into
> > PV...
> 
> I tried this:
> 
> change libfoo recipe to PV = "1.0+gitr${SRCPV}"
> leads to libfoo0_1.0+gitr102+someotherhash....ipk
> 
> then
> 
> change app recipe to DEPENDS = "... libfoo-1.0 ..."
> leads to: "ERROR: Nothing PROVIDES 'libfoo-1.0'" :(
> 
> change app recipe to DEPENDS = "... libfoo0-1.0 ..."
> leads to: "ERROR: Nothing PROVIDES 'libfoo0-1.0'" :(
> 
> change app recipe to DEPENDS = "... libfoo0_1.0 ..."
> leads to: "ERROR: Nothing PROVIDES 'libfoo0_1.0'" :(
> 
> Where's the mistake?

You'd need to do RDEPENDS_xxxx = "libfoo (>=1.0)"

Cheers,

Richard


