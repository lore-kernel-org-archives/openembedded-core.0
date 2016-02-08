Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 206657422C;
	Mon,  8 Feb 2016 12:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 95407180D8;
	Mon,  8 Feb 2016 13:08:41 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id GAslyPxa3Us8; Mon,  8 Feb 2016 13:08:40 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id AC82C180D2;
	Mon,  8 Feb 2016 13:08:40 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 687691584;
	Mon,  8 Feb 2016 13:08:40 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 5D372B1;
	Mon,  8 Feb 2016 13:08:40 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id 582D13E3A6;
	Mon,  8 Feb 2016 13:08:40 +0100 (CET)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.3.342.0;
	Mon, 8 Feb 2016 13:08:40 +0100
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id 138B39C075; 
	Mon,  8 Feb 2016 13:08:40 +0100 (CET)
Date: Mon, 8 Feb 2016 13:08:40 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160208120839.GL31212@axis.com>
References: <1454695470-8205-1-git-send-email-mac@mcrowe.com>
	<CAJTo0LbrD3JrzKM--emSMxDyERK4qstMVsMQ4VXisMpc6AvqqA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbrD3JrzKM--emSMxDyERK4qstMVsMQ4VXisMpc6AvqqA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/15] Prepare for EXTRA_OEMAKE = "" in bitbake.conf
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
X-List-Received-Date: Mon, 08 Feb 2016 12:08:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 16-02-08 11:49 +0000, Burton, Ross wrote:
> On 5 February 2016 at 18:04, Mike Crowe <mac@mcrowe.com> wrote:
> 
> > This series (sent only to openembedded-core) fixes various recipes
> > that rely on the current default value of
> > EXTRA_OEMAKE = "-e MAKEFLAGS=" to explicitly set that value in the
> > hope that bitbake.conf can set EXTRA_OEMAKE = "" in the future.
> >
> 
> We need to also vet all instances of EXTRA_OEMAKE in recipes.  I did a
> build with the EXTRA_OEMAKE change in bitbake.conf and hdparm failed to
> pass QA because the binary was already stripped, as the recipe does
> EXTRA_OEMAKE += "STRIP=echo".  That assignment isn't getting through to the
> makefiles without -e.

It should though, since all -e does is to make the environment
variables take precedence over make assignments. But in case of
assignments in EXTRA_OEMAKE, they are make assignments, so they
shouldn't be affected:

$ cat Makefile
FOO = bar

all:
        echo $(FOO)

.PHONY: all


$ make FOO=qux
echo qux
qux
$ make -e FOO=qux
echo qux
qux
$ FOO=qux make
echo bar
bar
$ FOO=qux make -e
echo qux
qux


-- 
olofjn

