Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S7dTf-0008AR-Cc
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 02:58:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id D24D6315A0D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 02:49:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id aUUwvFfgizVf
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 02:49:20 +0100 (CET)
Received: from [172.22.22.61] (drms-590cf1f2.pool.mediaWays.net
	[89.12.241.242])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id B21F4315A0CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 02:49:20 +0100 (CET)
Message-ID: <4F5FF91F.5010407@opendreambox.org>
Date: Wed, 14 Mar 2012 02:49:19 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: gdb 7.4 and libexpat
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Mar 2012 01:58:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi everybody,

in our rootfs, when debugging remotely with gdbserver on mips32el, gdb
7.4 fails to find symbol names for use in backtraces. gdb 7.3.1 works
well. One of my colleagues ran git bisect and discovered the culprit:

gdb git revision 22d678fdfdfc56ec75555f8f44ae5f0c4fc97e9a
http://sourceware.org/ml/gdb-patches/2011-11/msg00103.html

We haven't found out why this patch breaks symbol lookup. However, we
found three options to fix backtraces with version 7.4:

1.) Revert the changeset, possibly without understanding it fully.
2.) Enable expat in gdb, dragging libexpat into the image.
3.) Disable expat in gdb-cross, possibly losing functionality.

It seems that if one side is compiled with expat and the other is not,
then gdb and gdbserver now have problems communicating with each other.

Which way would you prefer?

Regards,
Andreas


