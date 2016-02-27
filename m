Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 83CCB7747B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Feb 2016 08:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1R8KowA010216; Sat, 27 Feb 2016 08:20:50 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id V7xUXpkIoUeY; Sat, 27 Feb 2016 08:20:50 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1R8Kj8r010213
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 27 Feb 2016 08:20:46 GMT
Message-ID: <1456561245.11498.119.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 27 Feb 2016 08:20:45 +0000
In-Reply-To: <1456552387-10564-5-git-send-email-armccurdy@gmail.com>
References: <1456552387-10564-1-git-send-email-armccurdy@gmail.com>
	<1456552387-10564-5-git-send-email-armccurdy@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 4/4] native.bbclass: poison TARGET_CFLAGS etc for native builds
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
X-List-Received-Date: Sat, 27 Feb 2016 08:20:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-02-26 at 21:53 -0800, Andre McCurdy wrote:
> TARGET_* FLAGS are never passed to the native toolchain. However,
> they are exported so their values affect the checksum of every task.
> 
> Replace with fixed values to both avoid any unnecessary rebuilding
> of native packages when target flags are changed (as before) and now
> also to poison any accidental use of target flags with the native
> toolchain.
> 
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/classes/native.bbclass | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/native.bbclass
> b/meta/classes/native.bbclass
> index f67ef00..34c08b2 100644
> --- a/meta/classes/native.bbclass
> +++ b/meta/classes/native.bbclass
> @@ -26,10 +26,18 @@ TARGET_PREFIX = "${BUILD_PREFIX}"
>  TARGET_CC_ARCH = "${BUILD_CC_ARCH}"
>  TARGET_LD_ARCH = "${BUILD_LD_ARCH}"
>  TARGET_AS_ARCH = "${BUILD_AS_ARCH}"
> -TARGET_CPPFLAGS = "${BUILD_CPPFLAGS}"
> -TARGET_CFLAGS = "${BUILD_CFLAGS}"
> -TARGET_CXXFLAGS = "${BUILD_CXXFLAGS}"
> -TARGET_LDFLAGS = "${BUILD_LDFLAGS}"
> +
> +# TARGET_* FLAGS are never passed to the native toolchain. However,
> they are
> +# exported so their values affect the checksum of every task.
> Replace with fixed
> +# values to both avoid any unnecessary rebuilding of native packages
> when target
> +# flags are changed and to poison any accidental use of target flags
> with the
> +# native toolchain.
> +TARGET_CPPFLAGS = "--target-cppflag-never-passed-to-the-native
> -toolchain"
> +TARGET_CFLAGS = "--target-cflag-never-passed-to-the-native
> -toolchain"
> +TARGET_CXXFLAGS = "--target-cxxflag-never-passed-to-the-native
> -toolchain"
> +TARGET_LDFLAGS = "--target-ldflag-never-passed-to-the-native
> -toolchain"

Wouldn't it perhaps be nicer just to unexport these?

I think

TARGET_CPPFLAGS[unexport] = "1"

might do it or we could do:

delvarFlag("TARGET_CPPFLAGS", "export")

?

Regardless of approach, this is likely going to need some extensive
testing.

Cheers,

Richard






