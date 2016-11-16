Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3C8BE6FFC8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 10:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uAGAlma5009818; Wed, 16 Nov 2016 10:47:48 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Rl7LVn2ua4Q3; Wed, 16 Nov 2016 10:47:48 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uAGAljGL009794
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 16 Nov 2016 10:47:46 GMT
Message-ID: <1479293265.28508.4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrii Bordunov <aborduno@cisco.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2016 10:47:45 +0000
In-Reply-To: <1476118955-12401-1-git-send-email-aborduno@cisco.com>
References: <1476118955-12401-1-git-send-email-aborduno@cisco.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: [PATCH] package.bbclass: allow using EXCLUDE_FROM_SHLIBS for subpackages
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
X-List-Received-Date: Wed, 16 Nov 2016 10:47:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-10-10 at 20:02 +0300, Andrii Bordunov wrote:
> Some packages containing shared libraries might be registered
> as shlib providers when they shouldn't (for example, the lib is for
> their private use and must not generate any dependency).
> 
> EXCLUDE_FROM_SHLIBS is targeted at that, but it could be set
> for entire recipe only.
> 
> This patch expands EXCLUDE_FROM_SHLIBS usage, so now it's possible
> to set it in a style similar with RDEPENDS. For example:
>  EXCLUDE_FROM_SHLIBS_${PN}-ptest = "1"
> 
> Signed-off-by: Andrii Bordunov <aborduno@cisco.com>
> ---
>  meta/classes/package.bbclass | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

My main concern here is actually performance. For a package with many
sub packages you just added many calls to getVar when that getVar is
extremely unlikely to find any value. Whilst not hugely slow, that
operation isn't trivial and hard to fix later.

I'm wondering if we could support the syntax

EXCLUDE_FROM_SHLIBS = "${PN}-ptest"

and then have "1", used in a couple of places as the special value to
mean all packages?

Also please use False, not 0 as the parameter to getVar.

Cheers,

Richard


