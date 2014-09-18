Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id D9873714B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 07:26:03 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id w10so839162pde.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 00:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=XdD0QMWRbnWq3MDSQ0QHh1P9wVRt3pucx1SdaEPxIVU=;
	b=X3maXGw0/Ivzd6/gC8egGzynq9+bRzJGhujSclNNnewKXHBn1C6nFeQNTHKeOmAptm
	PclCa6F36MKtFHoloTvw9XYcfFa6A822j8vLXMNfi69u13w0kFZr3av7hIpXnTfH3LZ+
	SV0YU5BlbaWs1BD6tqtwoRdToC41tg3S4bbWlrCYibXRwDohLKddwCb9uixyJUNPMqry
	hhxEBaeltfFiMIXeYYXF3qEOCQFpF0I/jsVD2qJw5YWyDSPkYXs/uIaQpIW/YsT65dlq
	0HYseTBl9MjwEfMTTnuX4Z3sKC8ByPAIWMQfoIJi7rF9gGPIQdOqjrjG0fIIFWhr+aS6
	gU4g==
X-Received: by 10.68.203.198 with SMTP id ks6mr3389367pbc.140.1411025164983;
	Thu, 18 Sep 2014 00:26:04 -0700 (PDT)
Received: from CACSVMO-14452.local (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218]) by mx.google.com with ESMTPSA id
	fl15sm18775711pdb.92.2014.09.18.00.26.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Sep 2014 00:26:04 -0700 (PDT)
Message-ID: <541A890A.8070709@gmail.com>
Date: Thu, 18 Sep 2014 00:26:02 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1410916622-26204-1-git-send-email-kergoth@gmail.com>
	<1410916622-26204-7-git-send-email-kergoth@gmail.com>
In-Reply-To: <1410916622-26204-7-git-send-email-kergoth@gmail.com>
Subject: Re: [PATCH v2 6/8] blktrace: obey LDFLAGS for btrecord
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
X-List-Received-Date: Thu, 18 Sep 2014 07:26:04 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



On 9/16/14 6:17 PM, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/recipes-kernel/blktrace/blktrace/ldflags.patch | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-kernel/blktrace/blktrace/ldflags.patch b/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
> index b9c7c20..037d161 100644
> --- a/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
> +++ b/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
> @@ -59,8 +59,12 @@ Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
>   INCS	= -I. -I.. -I../btt
>   OCFLAGS	= -UCOUNT_IOS -UDEBUG -DNDEBUG
>   XCFLAGS	= -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
> -@@ -35,7 +36,7 @@ btrecord: btrecord.o
> - 	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^)
> +@@ -32,10 +33,10 @@ clean: docsclean
> +	$(CC) $(CFLAGS) -c -o $*.o $<
> +
> + btrecord: btrecord.o
> +-	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^)
> ++	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^) $(LDFLAGS)
>   

aren't you passing LDFLAGS to compile step as well here ?


>   btreplay: btreplay.o
>  -	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^) $(LIBS)
> 

- -- 
- -Khem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.22 (Darwin)
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlQaiQoACgkQuwUzVZGdMxT8RgCeOnVS1P+8kPTGj+GbRQfGSPyb
NMAAmgKJL65/3Y5ot35pALZv8ZgRHxQ0
=DxWh
-----END PGP SIGNATURE-----

