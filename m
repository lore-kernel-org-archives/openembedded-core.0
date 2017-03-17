Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8CDA0601F2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 08:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2H8lQ2L025383; Fri, 17 Mar 2017 08:47:26 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QibF67DOnqwx; Fri, 17 Mar 2017 08:47:26 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2H8lMY5025358
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 17 Mar 2017 08:47:23 GMT
Message-ID: <1489740442.13980.134.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: brian avery <brian.avery@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 17 Mar 2017 08:47:22 +0000
In-Reply-To: <44af73e99b58322b14a9490f67c9417377404966.1489534872.git.brian.avery@intel.com>
References: <cover.1489534872.git.brian.avery@intel.com>
	<44af73e99b58322b14a9490f67c9417377404966.1489534872.git.brian.avery@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] gen-lockedsig-cache: catch os.link error
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
X-List-Received-Date: Fri, 17 Mar 2017 08:47:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-03-14 at 17:04 -0700, brian avery wrote:
> We do a hard link to speed up sdk creation but if your sstate-cache
> is
> across a file system boundary, this tries and fails. This patch
> catches
> that error and does a copy instead.
> 
> Signed-off-by: brian avery <brian.avery@intel.com>
> ---
>  scripts/gen-lockedsig-cache | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-
> cache
> index 49de74ed..1cfbeae 100755
> --- a/scripts/gen-lockedsig-cache
> +++ b/scripts/gen-lockedsig-cache
> @@ -63,6 +63,12 @@ for f in files:
>      if (os.stat(src).st_dev == os.stat(destdir).st_dev):
>          print('linking')
>          os.link(src, dst)
> +        try:
> +            os.link(src, dst)
> +        except Exception:
> +            print('hard linking failed, copying')
> +            shutil.copyfile(src, dst)
> +        os.link(src, dst)
>      else:
>          print('copying')
>          shutil.copyfile(src, dst)

Really? How many os.link() calls do we need?

Also, "Exception" without a specific exception you want to catch tends
to be a bad idea.

Cheers,

Richard



