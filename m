Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 416EE6FF30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 16:47:29 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5HGkbrt002511; Tue, 17 Jun 2014 17:47:09 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6-GOwwsgVvrt; Tue, 17 Jun 2014 17:47:09 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5HGl3XO002648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 17 Jun 2014 17:47:05 +0100
Message-ID: <1403023618.2104.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Hart, Darren" <darren.hart@intel.com>
Date: Tue, 17 Jun 2014 17:46:58 +0100
In-Reply-To: <CFC5A0C1.97B0E%darren.hart@intel.com>
References: <1402674385.29913.6.camel@ted>
	<CADkTA4MtGT145NMXzwfL9z6HDnrLzbvcDdeGeCjC5AJuN-Ad+g@mail.gmail.com>
	<20140613191356.GR27324@denix.org>
	<CFC5A0C1.97B0E%darren.hart@intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Scott Rifenbark <srifenbark@gmail.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-module-split: Add support for KERNEL_MODULE_AUTOLOAD and KERNEL_MODULE_PROBECONF
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
X-List-Received-Date: Tue, 17 Jun 2014 16:47:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-06-17 at 14:53 +0000, Hart, Darren wrote:
> Adding Scott R.

I do need to sort out a documentation update.

> I was just looking into that. It appears the ref-manual.html is the place
> to update. The glossary has a module_autoload definition, which I suppose
> needs to be replaced with KERNEL_MODULE_AUTOLOAD, which  will have
> slightly different semantics.
> 
> If I understand this correctly, the old model was:
> 
> 	module_autoload_foo = "foo"
> 	module_autoload_bar = "bar"
> 
> Although the following line in the docs confuses me:
> 
> 	module_autoload_<modname> = "modname1 modname2 modname3"

That is just wrong.

> 
> And now, if I interpreted the commit comment correctly, it should look
> like:
> 
> 	KERNEL_MODULE_AUTOLOAD = "foo"
> 	...
> 	KERNEL_MODULE_AUTOLOAD += "bar"

Correct.

> I'm not sure how KERNEL_MODULE_PROBECONF is involved, or what value it
> brings beyond module_conf. From what I can tell, the changes now require:
> 
> 	KERNEL_MODULE_PROBECONF = "foo"
> 
> 	module_conf_foo = "options foo baz=1"
> 
> (/me notes the order of operations is non-obvious here "if modconf and
> basename in modconflist")

For module_conf, the value is the build system can know which variables
were set and account for them in the task checksums. If it doesn't have
the list, we'd have to iterate the whole data store and that is a
*painfully* slow operation.

module_conf isn't commonly used so maintaining a list isn't too much of
a hardship IMO.

> Do I have this correct?

Yes.

CHeers,

Richard


