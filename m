Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5723D71E53
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 11:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0PBuKSH024588; Wed, 25 Jan 2017 11:56:20 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IyZqlShQYwpS; Wed, 25 Jan 2017 11:56:20 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0PBuIw3024584
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 25 Jan 2017 11:56:19 GMT
Message-ID: <1485345378.30673.88.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <clarson@kergoth.com>, Mariano Lopez
	<mariano.lopez@linux.intel.com>
Date: Wed, 25 Jan 2017 11:56:18 +0000
In-Reply-To: <CABcZANn9jc51biiwD=0v9izwzovbpwaE0bLtnpBX3VE=oVLfiQ@mail.gmail.com>
References: <cover.1485247027.git.mariano.lopez@linux.intel.com>
	<f375139dfac77be3c12335a6a302582368ceeb13.1485247027.git.mariano.lopez@linux.intel.com>
	<CABcZANn9jc51biiwD=0v9izwzovbpwaE0bLtnpBX3VE=oVLfiQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] package_ipk.bbclass: Add check for empty lines in DESCRIPTION
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
X-List-Received-Date: Wed, 25 Jan 2017 11:58:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-01-24 at 11:52 -0700, Christopher Larson wrote:
> 
> On Tue, Jan 24, 2017 at 1:37 AM, <mariano.lopez@linux.intel.com>
> wrote:
> > From: Mariano Lopez <mariano.lopez@linux.intel.com>
> > 
> > opkg uses empty lines as separator for next package and if an ipk
> > file was packaged with empty lines in DESCRIPTION opkg won't be
> > able to handle such ipk file, this happens at execution time.
> > 
> > This commit will add a check for empty lines in DESCRIPTION when
> > generating to ipk package to avoid this issue.
> > 
> > [YOCTO #10677]
> > 
> > Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> > 
> Could it handle a line with just a space, or a period? Could you not
> replace the lines with that instead, rather than aborting?

FWIW package_deb uses ".".

Also, please use bb.fatal() calls with caution, I just removed several
from that class. In this case its perhaps ok but often the correct
thing to do is raise an exception of some kind. This means bitbake will
generate a usable traceback rather than simply printing the fatal
message. In this case the message is probably fine but there were
several cases where a traceback was a much better idea as the fatal
message wasn't enough to debug with.

Cheers,

Richard

