Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3E06B6B5E0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jun 2014 11:33:32 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s55BXQMM021376; Thu, 5 Jun 2014 12:33:26 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hRDQOmjhvPG9; Thu,  5 Jun 2014 12:33:26 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s55BXOuW021373
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 5 Jun 2014 12:33:25 +0100
Message-ID: <1401967996.12440.185.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 05 Jun 2014 12:33:16 +0100
In-Reply-To: <CAPybu_3Jz=KNmYjE+crCFBuxpmJGmS7DfOM9fmDXFGOADmwyFg@mail.gmail.com>
References: <CAPybu_3Jz=KNmYjE+crCFBuxpmJGmS7DfOM9fmDXFGOADmwyFg@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: PR_Service. Sync database only on clean stop?
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
X-List-Received-Date: Thu, 05 Jun 2014 11:33:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-06-04 at 22:52 +0200, Ricardo Ribalda Delgado wrote:
> Hello
> 
> I have been running happily with pr_service for two months.
> Unfortunately, due to a power down the computer running the pr server
> has stopped.
> When I have started the server I have discovered that all the
> information about PR was lost :S. I assumed this was due to a db
> corruption, but I have later discovered that the database is not
> synced after every insert.
> 
> I guess this is to improve the performance, but I don't think that
> everybody prefer this behaviour, right now I have to remake and
> distribute only 10 flashes, something reasonable, but it would have a
> disaster later in our development cycle.
> 
> Is somebody working on a parameter for the db to be persistent? Would
> a patch to implement this be considered?

The trouble if I remember rightly is that the way the queries work in
there, you can't tell if an update was made the database during the read
or not. The older code therefore synced on *every* read and this was a
significant bottleneck.

So patches would be considered and I agree the current behaviour is bad
but we need to be mindful of performance too. Some kind of idle sync on
a timer might be better than specific numbers for example, particularly
if we can query whether the data is "dirty" before running the sync
commands.

Cheers,

Richard




