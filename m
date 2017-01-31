Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E0E96772B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 23:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0VNG5Sc008231; Tue, 31 Jan 2017 23:16:05 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GnbMAahAqvsv; Tue, 31 Jan 2017 23:16:05 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0VNG0tO008226
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 31 Jan 2017 23:16:01 GMT
Message-ID: <1485904560.14144.18.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: leonardo.sandoval.gonzalez@linux.intel.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 23:16:00 +0000
In-Reply-To: <d08deb0bac4d1f00b7d0467098addb5af0583bf2.1485902097.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1485902097.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<d08deb0bac4d1f00b7d0467098addb5af0583bf2.1485902097.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/4] selftest/buildoptions: force compile task instead of cleaning sstates
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
X-List-Received-Date: Tue, 31 Jan 2017 23:18:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-01-31 at 16:50 -0600,
leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> There is no need to clean m4 sstates, use force instead.
> 
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.in
> tel.com>
> ---
>  meta/lib/oeqa/selftest/buildoptions.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/buildoptions.py
> b/meta/lib/oeqa/selftest/buildoptions.py
> index 004b2dd..a83088f 100644
> --- a/meta/lib/oeqa/selftest/buildoptions.py
> +++ b/meta/lib/oeqa/selftest/buildoptions.py
> @@ -36,8 +36,7 @@ class ImageOptionsTests(oeSelfTest):
>          p = get_bb_var('SYSROOT_DESTDIR', 'ccache-native') +
> get_bb_var('bindir', 'ccache-native') + "/" + "ccache"
>          self.assertTrue(os.path.isfile(p), msg = "No ccache found
> (%s)" % p)
>          self.write_config('INHERIT += "ccache"')
> -        bitbake("m4 -c cleansstate")
> -        bitbake("m4 -c compile")
> +        bitbake("m4 -c compile -f")
>          self.addCleanup(bitbake, 'ccache-native -ccleansstate')
>          res = runCmd("grep ccache %s" %
> (os.path.join(get_bb_var("WORKDIR","m4"),"temp/log.do_compile")),
> ignore_status=True)
>          self.assertEqual(0, res.status, msg="No match for ccache in
> m4 log.do_compile. For further details: %s" %
> os.path.join(get_bb_var("WORKDIR","m4"),"temp/log.do_compile"))

If we force something like this we really need a cleanup in there to
remove the taint too...

Cheers,

Richard

