Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U5CBp-0004Xs-Gp
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 10:30:19 +0100
Received: by mail-ea0-f171.google.com with SMTP id c13so51669eaa.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 01:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=jQZkBL4i9QNH4nS6S9nCD5QZAb4/3ZzA43VZitoHl8U=;
	b=xPe2xHsYaRgTlfs6znNUjL4RWOEOktaf1sz6LGjnwrxaEpdZ6mDEjE6kEd0Elb4Cj1
	g3J8Z0b70z3CxjzR8xnEyUougyZy1UlsLQjpYzYwhPSUYUsndZ1sez/i8na+cbdz58xq
	B89XBYS7FqyuZbfwm42r8EAuXa4Xdda7yxhZ3TuIh1ggr61WjJfdMFg2+zUmUZ0KoHq+
	trX9GPMZ1dOS/WOWyeaG4S+5A3s69XztkJJz+fY8BvA8Bml2NeCrZDArNI/Soc8Oi2Xo
	BrEuQEjNeQt+gnI6Xy62/1zskxjzSWggBQP2qVx8UXwauPeBzfWpHa7QUs0KIHf0rADJ
	06kg==
X-Received: by 10.14.193.198 with SMTP id k46mr60067617een.40.1360660454380;
	Tue, 12 Feb 2013 01:14:14 -0800 (PST)
Received: from s42.loc (91-119-218-53.dynamic.xdsl-line.inode.at.
	[91.119.218.53])
	by mx.google.com with ESMTPS id a1sm41428871eep.2.2013.02.12.01.14.12
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 12 Feb 2013 01:14:12 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.80)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1U5BwI-0005Jc-LC; Tue, 12 Feb 2013 10:14:10 +0100
Date: Tue, 12 Feb 2013 10:14:09 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130212091409.GA20419@mx.loc>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
	<c4bfd1da6209da458cb0944a719801346f300dd9.1360079373.git.rep.dot.nop@gmail.com>
	<5119D737.3000309@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <5119D737.3000309@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/8] busybox: add ifup's ifstate dir to package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 09:30:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 11, 2013 at 09:46:31PM -0800, Saul Wold wrote:
>On 02/05/2013 07:55 AM, Bernhard Reutner-Fischer wrote:
>>ifupdown stores its ifstate into CONFIG_IFIPDOWN_IFSTATE_PATH.
>>Fixes:
>>ifup: can't open '/var/run/ifstate': No such file or directory
>>
>>Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>>---
>>  meta/recipes-core/busybox/busybox.inc |    4 ++++
>>  1 file changed, 4 insertions(+)
>>
>>diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
>>index 972e7d0..972df6d 100644
>>--- a/meta/recipes-core/busybox/busybox.inc
>>+++ b/meta/recipes-core/busybox/busybox.inc
>>@@ -199,6 +199,10 @@ do_install () {
>>                         install -m 644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf
>>                 fi
>>  	fi
>>+	IFUPDOWN_IFSTATE_PATH=`awk '/^CONFIG_IFUPDOWN_IFSTATE_PATH/{split($0,x,/=/);p=x[2];gsub("\"","",p);print p;}' ${WORKDIR}/defconfig`
>>+	if test -n "$IFUPDOWN_IFSTATE_PATH"; then
>Should this also be ${D} in the test, other wise you might be testing
>the host!

WORKDIR is correct, see meta/conf/bitbake.conf setting WORKDIR.
thanks,
>
>
>Sau!
>
>>+		install -m 0755 -d ${D}/"$IFUPDOWN_IFSTATE_PATH"
>>+	fi
>>  	install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
>>  }
>>
>>


