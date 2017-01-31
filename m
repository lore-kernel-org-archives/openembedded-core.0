Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 47D4871CA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 23:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0VNGRvg008268; Tue, 31 Jan 2017 23:17:00 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id frSjssqV-DFo; Tue, 31 Jan 2017 23:17:00 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0VNGwsm008334
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 31 Jan 2017 23:16:59 GMT
Message-ID: <1485904618.14144.19.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: leonardo.sandoval.gonzalez@linux.intel.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 23:16:58 +0000
In-Reply-To: <6e39192de91d20d920b9f4982e669874aa659625.1485902097.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1485902097.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<6e39192de91d20d920b9f4982e669874aa659625.1485902097.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/4] selftest/buildoptions: use a thinner image to test 'read-only-rootfs' feature
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
X-List-Received-Date: Tue, 31 Jan 2017 23:17:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-01-31 at 16:50 -0600,
leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> The minimal is much faster to build that sato, so use the former to
> test
> read-only feature.
> 
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.in
> tel.com>
> ---
>  meta/lib/oeqa/selftest/buildoptions.py | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/buildoptions.py
> b/meta/lib/oeqa/selftest/buildoptions.py
> index d40eb00..004b2dd 100644
> --- a/meta/lib/oeqa/selftest/buildoptions.py
> +++ b/meta/lib/oeqa/selftest/buildoptions.py
> @@ -44,11 +44,8 @@ class ImageOptionsTests(oeSelfTest):
>  
>      @testcase(1435)
>      def test_read_only_image(self):
> -        distro_features = get_bb_var('DISTRO_FEATURES')
> -        if not ('x11' in distro_features and 'opengl' in
> distro_features):
> -            self.skipTest('core-image-sato requires x11 and opengl
> in distro features')
>          self.write_config('IMAGE_FEATURES += "read-only-rootfs"')
> -        bitbake("core-image-sato")
> +        bitbake("core-image-minimal")
>          # do_image will fail if there are any pending postinsts

Whilst this is certainly going to be a touch faster, I believe we do
want to test read only rootfs with a larger image like sato to make
sure the postinsts really do work with a read only system?

Cheers,

Richard

