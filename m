Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5707F6078E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 May 2017 23:15:27 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v41NDHxq012411
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 2 May 2017 00:13:18 +0100
Message-ID: <1493680397.23535.47.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Juro Bystricky <juro.bystricky@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 02 May 2017 00:13:17 +0100
In-Reply-To: <1493672344-21965-2-git-send-email-juro.bystricky@intel.com>
References: <1493672344-21965-1-git-send-email-juro.bystricky@intel.com>
	<1493672344-21965-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 02 May 2017 00:13:19 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: jurobystricky@hotmail.com
Subject: Re: [PATCH v2 1/6] bitbake.conf: new variable BUILD_REPRODUCIBLE_BINARIES
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
X-List-Received-Date: Mon, 01 May 2017 23:15:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-05-01 at 13:58 -0700, Juro Bystricky wrote:
> Building reproducible binaries may remove certain intentional
> randomness intended for increased security. Hence, it is reasonable
> to expect there will be cases where this is not desirable.
> The user can select his/her preferences via the variable
> BUILD_REPRODUCIBLE_BINARIES. The variable defaults to "0" (do not
> build reproducible binaries) in order to minimize any potential
> regressions. (Once the reproducible binaries code is mature enough,
> it can be set to "1".)
> If the variable BUILD_REPRODUCIBLE_BINARIES is set to "1",
> timestamp values taken from additional variables will be optionally
> used
> when building binary reproducible images:
> 
>     REPRODUCIBLE_TIMESTAMP_ROOTFS
>         If the value is specified, all files mtime will be set to
> this value.
>         In addition, /etc/timestamp and /etc/version will both
> contain the value.
>         If no value is specified, timestamp will be derived from the
> top git commit.
> 
>     REPRODUCIBLE_TIMESTAMP_IMAGE_PRELINK
>         Value passed via environment variable PRELINK_TIMESTAMP to
> the prelink program.
>         If the value is specified, the value will be used.
>         If no value is specified, timestamp will be derived from the
> top git commit.
> 
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/conf/bitbake.conf | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 227babd..6ce1a1a 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -859,3 +859,14 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends
> \
>  
>  MLPREFIX ??= ""
>  MULTILIB_VARIANTS ??= ""
> +
> +BUILD_REPRODUCIBLE_BINARIES ??= "0"
> +BUILD_REPRODUCIBLE_BINARIES[export] = "1"
> +
> +# Unix timestamp
> +REPRODUCIBLE_TIMESTAMP_ROOTFS ??= ""
> +REPRODUCIBLE_TIMESTAMP_ROOTFS[export] = "1"
> +
> +# Unix timestamp
> +REPRODUCIBLE_TIMESTAMP_IMAGE_PRELINK ??= ""
> +REPRODUCIBLE_TIMESTAMP_IMAGE_PRELINK[export] = "1"

Please don't add new global exports in bitbake.conf. Changing the value
of this will cause everything to rebuild (e.g. recompile) since the
exported environment goes to all tasks. We really don't want to do that
if it only affects the image generation.

I'll give this a bit more thought/review but wanted to comment on this
whilst I see it/remember.

Cheers,

Richard


