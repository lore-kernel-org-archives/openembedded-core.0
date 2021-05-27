Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.10020.1622135551710441524
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 10:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=K9FbFK/I;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.1.99] (cpe-68-201-52-49.elp.res.rr.com [68.201.52.49])
	by linux.microsoft.com (Postfix) with ESMTPSA id 81D5B20B7188;
	Thu, 27 May 2021 10:12:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 81D5B20B7188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1622135551;
	bh=5PFrNhrU+mTLnBc6L7geBysXx+4IlZ2NfAoLVVvLYCo=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=K9FbFK/IS3LeiU7fCmc0WNo3UyRrcps968/E9ZOljKQigPNaM+awnIQDSP7ZwfY+I
	 GiT56Ez4tG5+pal88yLLjqlcUkRWs3TQrKkM9KeHGTz9xgXF/L8Jd+GVMW1lqBps6L
	 Fw9X6mHql7wYv3GPxR8yrOtMmwJImgaSF7NfEN30=
Subject: Re: [OE-core] [PATCH] gcc-cross-canadian: Install gcc/g++ wrappers for musl
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Leon Woestenberg <leon@sidebranch.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1682FB2B52C53C5B.5334@lists.openembedded.org>
From: "Alejandro Hernandez Samaniego" <alhe@linux.microsoft.com>
Message-ID: <6c91ebb7-b45a-663b-6ca1-1b90beaa3158@linux.microsoft.com>
Date: Thu, 27 May 2021 11:12:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1682FB2B52C53C5B.5334@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------99ED3D892687CE693920832C"
Content-Language: en-US

--------------99ED3D892687CE693920832C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Please discard this patch, this was meant to be for dunfell, its missing 
the tag due to a typo

Alejandro

On 5/27/21 11:02 AM, Alejandro Hernandez Samaniego wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> gcc needs -mmusl option to be passed in SDK since we ship crossdk compiler
> configured for glibc by default, this helps in creating correct
> compiler defaults for musl based SDK compilers
>
> [YOCTO #13459]
>
> (From OE-Core rev: e6fbac7aeabe00d8fb734992012dd629a8527b25)
>
> Cc: Leon Woestenberg <leon@sidebranch.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
> ---
>   .../gcc/gcc-cross-canadian.inc                | 23 +++++++++++++++++++
>   1 file changed, 23 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> index 553ef7fe62..c5935b978d 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -139,6 +139,29 @@ do_install () {
>   	chown -R root:root ${D}
>   	
>   	cross_canadian_bindirlinks
> +
> +	for i in linux ${CANADIANEXTRAOS}
> +	do
> +		for v in ${CANADIANEXTRAVENDOR}
> +		do
> +			d=${D}${bindir}/../${TARGET_ARCH}$v-$i
> +			install -d $d
> +			for j in ${TARGET_PREFIX}gcc${EXEEXT} ${TARGET_PREFIX}g++${EXEEXT}
> +			do
> +				p=${TARGET_ARCH}$v-$i-`echo $j | sed -e s,${TARGET_PREFIX},,`
> +				case $i in
> +				*musl*)
> +					rm -rf $d/$p
> +					echo "#!/usr/bin/env sh" > $d/$p
> +					echo "exec \`dirname \$0\`/../${TARGET_SYS}/$j -mmusl \$@" >> $d/$p
> +					chmod 0755 $d/$p
> +					;;
> +				*)
> +					;;
> +				esac
> +			done
> +		done
> +	done
>   }
>   
>   ELFUTILS = "nativesdk-elfutils"
>
> 
>

--------------99ED3D892687CE693920832C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Please discard this patch, this was meant to be for dunfell, its
      missing the tag due to a typo</p>
    <p>Alejandro<br>
    </p>
    <div class="moz-cite-prefix">On 5/27/21 11:02 AM, Alejandro
      Hernandez Samaniego wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1682FB2B52C53C5B.5334@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>

gcc needs -mmusl option to be passed in SDK since we ship crossdk compiler
configured for glibc by default, this helps in creating correct
compiler defaults for musl based SDK compilers

[YOCTO #13459]

(From OE-Core rev: e6fbac7aeabe00d8fb734992012dd629a8527b25)

Cc: Leon Woestenberg <a class="moz-txt-link-rfc2396E" href="mailto:leon@sidebranch.com">&lt;leon@sidebranch.com&gt;</a>
Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
Signed-off-by: Alejandro Hernandez Samaniego <a class="moz-txt-link-rfc2396E" href="mailto:alhe@linux.microsoft.com">&lt;alhe@linux.microsoft.com&gt;</a>
---
 .../gcc/gcc-cross-canadian.inc                | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 553ef7fe62..c5935b978d 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -139,6 +139,29 @@ do_install () {
 	chown -R root:root ${D}
 	
 	cross_canadian_bindirlinks
+
+	for i in linux ${CANADIANEXTRAOS}
+	do
+		for v in ${CANADIANEXTRAVENDOR}
+		do
+			d=${D}${bindir}/../${TARGET_ARCH}$v-$i
+			install -d $d
+			for j in ${TARGET_PREFIX}gcc${EXEEXT} ${TARGET_PREFIX}g++${EXEEXT}
+			do
+				p=${TARGET_ARCH}$v-$i-`echo $j | sed -e s,${TARGET_PREFIX},,`
+				case $i in
+				*musl*)
+					rm -rf $d/$p
+					echo "#!/usr/bin/env sh" &gt; $d/$p
+					echo "exec \`dirname \$0\`/../${TARGET_SYS}/$j -mmusl \$@" &gt;&gt; $d/$p
+					chmod 0755 $d/$p
+					;;
+				*)
+					;;
+				esac
+			done
+		done
+	done
 }
 
 ELFUTILS = "nativesdk-elfutils"
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------99ED3D892687CE693920832C--
