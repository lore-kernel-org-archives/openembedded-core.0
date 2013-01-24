Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TyTIb-00058k-W5 for Openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 21:21:27 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0OKA0pq015743; Thu, 24 Jan 2013 20:10:00 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3eIHPie7Yqvb; Thu, 24 Jan 2013 20:10:00 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0OK9s3O015708
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 24 Jan 2013 20:09:57 GMT
Message-ID: <1359057938.3616.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Seebach <peter.seebach@windriver.com>
Date: Thu, 24 Jan 2013 20:05:38 +0000
In-Reply-To: <20130123144320.191c91a3@e6410-2>
References: <20130123144320.191c91a3@e6410-2>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: Is this a bug? Installed-but-not-packaged warning for a file which is in a package
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
X-List-Received-Date: Thu, 24 Jan 2013 20:21:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-01-23 at 14:43 -0600, Peter Seebach wrote:
> FILES_${PN} = "fascinating"
> 
> do_install() {
> 	touch ${D}/fascinating
> }
> 
> At least in our local copy of oe-core, this results in:
> 
> 1. A package which contains a /fascinating file.
> 2. An installed-but-unpackaged warning for /fascinating.
> 
> This confused the heck out of me. I eventually figured it out: The "not
> in seen" test is not aware of the possibility of differing path names.
> In general, all path names in FILES_* are being written as absolute
> paths by convention; in the actual code, this is silently corrected by
> the addition of a leading period.
> 
> But an unqualified path works; it's treated as relative to the
> sysroot/image/whatever, and it has the expected behavior. But then we
> insert "fascinating" in seen, and check for "./fascinating" in the next
> phase.
> 
> Possible solution:
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index b06cca5..9d50a61 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -981,6 +981,8 @@ python populate_packages () {
>                  file.replace("//", "/")
>              if os.path.isabs(file):
>                  file = '.' + file
> +            if not file.startswith("./")
> +                fle = './' + file
>              if not os.path.islink(file):
>                  if os.path.isdir(file):
> 
> Before I send this as an actual patch and such: Is this behavior a bug?
> If it is a bug, is this the right fix, or should we do something else,
> like reject non-absolute paths?
> 
> Note that just adding a / to files that don't start with one doesn't
> work; there appear to be at least *some* non-absolute paths in some
> packages.

It is a bug and that would appear to be a reasonable fix or fix the
unshipped list construction so it handles items without a . correctly.
I'd take the above patch...

Cheers,

Richard



