Return-Path: <olof.johansson@axis.com>
Received: from anubis.se.axis.com (anubis.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2FF096E8D3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 15:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id 9CDEF1A012;
	Fri, 24 Jan 2014 16:17:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AzMINe5-TBo0; Fri, 24 Jan 2014 16:17:04 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by anubis.se.axis.com (Postfix) with ESMTP id 601271A019;
	Fri, 24 Jan 2014 16:17:03 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 01212BE0;
	Fri, 24 Jan 2014 16:17:03 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id EA208BD9;
	Fri, 24 Jan 2014 16:17:02 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id E7EFE3E06F;
	Fri, 24 Jan 2014 16:17:02 +0100 (CET)
Received: from axis.com (10.92.17.1) by xmail2.se.axis.com (10.0.5.74) with
	Microsoft SMTP Server (TLS) id 8.2.255.0;
	Fri, 24 Jan 2014 16:17:02 +0100
Date: Fri, 24 Jan 2014 16:17:01 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20140124151701.GJ15815@axis.com>
References: <cover.1390220655.git.liezhi.yang@windriver.com>
	<0fbf5062299128b4b654de870a54f22a7cf8633a.1390220655.git.liezhi.yang@windriver.com>
	<1390571019.17424.173.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1390571019.17424.173.camel@ted>
Thread-Topic: [OE-core] [PATCH 1/1] e2fsprogs/populate-extfs.sh: fix a
	problem on dash
Accept-Language: en-US, sv-SE
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] e2fsprogs/populate-extfs.sh: fix a problem on dash
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
X-List-Received-Date: Fri, 24 Jan 2014 15:17:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Language: en-US

On 14-01-24 14:43 +0100, Richard Purdie wrote:
> On Mon, 2014-01-20 at 20:24 +0800, Robert Yang wrote:
> > The dash can't handle the or [[ in parameter expansion, for example:

Good to know. Interesting! Noting that escaping the [ would work,
but not applicable in this case.

> > 
> > A=/usr/bin/[[
> > B=[[
> > C="${A%$B}"

Would ${A%/*}/ work?

-                DIR="${DIR%$TGT}"
+                DIR="${DIR%/*}/"

It also has the advantage that it doesn't cause a fork (afaict,
the loop is being executed for every file in a rootfs directory
structure, that could cause a lot of forks).

(Disclaimer: I haven't tested this)

-- 
olofjn

