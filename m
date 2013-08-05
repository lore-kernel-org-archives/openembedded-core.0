Return-Path: <walters@verbum.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 0523A6041E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 19:50:28 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id D38F821850;
	Mon,  5 Aug 2013 15:50:27 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute2.internal (MEProxy); Mon, 05 Aug 2013 15:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:in-reply-to:references
	:content-type:date:message-id:mime-version
	:content-transfer-encoding; s=smtpout; bh=1Cg+T9DDzcWwqsssqrXird
	tej3M=; b=t/yelOnfkNajN6T9Z4FQQwB/QjN5Cl6/D0G5Qu3x1jg4qsdwJ//JU2
	pE9hjU82ZBaNSGFhtuXL1YdyutFIovLFBCzpfK8s0Drjq3JeQtDIgPXhbdElWvWh
	lFtnZS5No/bUaOXqLdcpnwjRSse6E+nJcDnc+wLb0IRwZc/4aPD7M=
X-Sasl-enc: aaJofIOpt8E1TnlmKuxGKsI2vJCdSga7yr/gWRkDoHGa 1375732227
Received: from [10.153.0.114] (unknown [217.69.97.51])
	by mail.messagingengine.com (Postfix) with ESMTPA id 48998680094;
	Mon,  5 Aug 2013 15:50:27 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: Stefan Stanacar <stefanx.stanacar@intel.com>
In-Reply-To: <3047815ee6268db95c3916960eb31508fb7729f6.1372413711.git.stefanx.stanacar@intel.com>
References: <cover.1372413711.git.stefanx.stanacar@intel.com>
	<3047815ee6268db95c3916960eb31508fb7729f6.1372413711.git.stefanx.stanacar@intel.com>
Date: Mon, 05 Aug 2013 21:50:26 +0200
Message-ID: <1375732226.4750.25.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 (2.32.3-13.el6) 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 5/8] lib/oeqa/utils/qemurunner.py: class to handle qemu instance
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
X-List-Received-Date: Mon, 05 Aug 2013 19:50:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-06-28 at 13:04 +0300, Stefan Stanacar wrote:

> +        self.streampath = '/tmp/qemuconnection.%s' % os.getpid()

That's a security problem on shared machines.

> +                bb.note("Reached login banner")
> +                console.write("root\n")
> +                (index, match, text) = console.expect([r"(root@[\w-]+:~#)"],10)

So I forget if I've mentioned this here, but what I do for the
gnome-ostree testing is at boot time, use a qcow2 overlay disk to write
a custom systemd service that exports the journal over a virtio-serial
channel.  Then I look for specific MESSAGE_IDs in the journal.

This is extremely reliable, no parsing of log messages etc.

See:
https://rwmj.wordpress.com/2013/07/19/half-baked-ideas-ocr-vm-console-to-diagnose-state-and-errors/



