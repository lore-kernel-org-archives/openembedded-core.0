Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id A275760119
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 12:07:42 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id v123so134986143qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 05:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o6IO8RMOEWV+yDHyye9q6GF1U/7DOnoKIYmerSE6Yu8=;
	b=phtQdX/IIrkCH2j7/3A6y8BhwhenjzlcJIZjWguCvHX5vRugynJR45ndV0t0a2u9lT
	ugoBtOXVr83cZVml0V6w+pEqd0NmKOpQ9xwQBiza5Qw3Kupms+KjGcqv9hKOUj0j9M+R
	9m7ZR6n4ivDrV2cbuTy+FLTqzoYnHuCVrUYdnXZLnbTLPT6G6tsm9smQeSEjdT/1Zzjz
	vkrbzCh5+27TZ31gFhQcsrkibeXiQYVKlzsOV9gKPY+5YIatUQWBM1bv1Dw5BxI9BxVw
	mIG/9v2tKpoTrouXRXN1BRo6MQFw+f8oVfy1eerSRt7mqjfMftV0Ja2CmEd6sbx2SSCb
	JpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o6IO8RMOEWV+yDHyye9q6GF1U/7DOnoKIYmerSE6Yu8=;
	b=E0QSCeZWq8owN0wfo2tZt/xSCQDAkPoI0WAekV/siZkN5OKbiWjOfzEB9HiSlzy5Db
	47EbUfwKFS1WvgitIcbaBWXvTCaFJ5qVqBzQnHbeXmnksmMQZ6CTPhPZSKxayc9uEe7v
	OSx6S3IH1d5shVd+Ic6B5cEpWjufkGJ3C7Pt9H+3JVDBZXTKeRsVjCOrwKitgwKlW/1j
	4M0WskuZvDj0hj9C1XjMO4M8Cre7PvsrwxTgs0MXGk70mhzACVnl5jr6tXJg2EVchcYH
	Yy2PBVhzwWARHl5+w+jbgqWF9ZIxxEGhR0vZZVm9N5pn6cEANWtjxBkV4ADqsDJhCYu1
	5XXQ==
X-Gm-Message-State: AE9vXwOjfKX4n51Lrxm+9Ul37A2FtmwF5JP+rTW8a0WAaCjJoWX9nxhC1oCRLYfXZwBnHCCvXkouPg20ml6bfA==
X-Received: by 10.55.209.140 with SMTP id o12mr9726020qkl.286.1472472462241;
	Mon, 29 Aug 2016 05:07:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Mon, 29 Aug 2016 05:07:41 -0700 (PDT)
In-Reply-To: <20160829091905.1068-1-adrian.ratiu@ni.com>
References: <20160829091905.1068-1-adrian.ratiu@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 29 Aug 2016 08:07:41 -0400
Message-ID: <CADkTA4MS=7NyodK3chia_1Ev-cr_jNvyMnUWKWSstZZxFMTb5Q@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: Yocto Project Discussion <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto-kernel-tools][PATCH] merge_configs.sh: fail loudly if make also fails
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
X-List-Received-Date: Mon, 29 Aug 2016 12:07:44 -0000
Content-Type: multipart/alternative; boundary=001a1147a29e0db561053b34b611

--001a1147a29e0db561053b34b611
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 29, 2016 at 5:19 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
wrote:

> merge_configs.sh calls make on the generated kernel config from
> the defconfig + fragments to fill in any missing symbols. make
> can fail and this can lead to nasty errors further on in the
> build like generating an unbootable kernel image.
>
> Check the make return code and fail loudly if non-zero.
>

We don't want merge config to fail in a scenario like this. It is up to
whatever
calls merge_config to add that sort of logic. Which is what I do with the
kernel
audit phase of linux-yocto.

If you do want to try and make it fail in a scenario like this, the patch
needs to
go to the linux kernel mailing list.

Cheers,

Bruce


>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  tools/merge_config.sh | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/tools/merge_config.sh b/tools/merge_config.sh
> index 67d1314..5212f37 100755
> --- a/tools/merge_config.sh
> +++ b/tools/merge_config.sh
> @@ -152,7 +152,10 @@ fi
>  # alldefconfig: Fills in any missing symbols with Kconfig default
>  # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
>  make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
> -
> +if [ "$?" -ne 0 ]; then
> +    echo "Make failed to fill missing config symbols. Exit." >&2
> +    exit 1
> +fi


>  # Check all specified config values took (might have missed-dependency
> issues)
>  for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
> --
> 2.9.3
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1147a29e0db561053b34b611
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Aug 29, 2016 at 5:19 AM, Ioan-Adrian Ratiu <span dir=3D"ltr">&l=
t;<a href=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">merge_configs.s=
h calls make on the generated kernel config from<br>
the defconfig + fragments to fill in any missing symbols. make<br>
can fail and this can lead to nasty errors further on in the<br>
build like generating an unbootable kernel image.<br>
<br>
Check the make return code and fail loudly if non-zero.<br></blockquote><di=
v><br></div><div>We don&#39;t want merge config to fail in a scenario like =
this. It is up to whatever</div><div>calls merge_config to add that sort of=
 logic. Which is what I do with the kernel</div><div>audit phase of linux-y=
octo.</div><div><br></div><div>If you do want to try and make it fail in a =
scenario like this, the patch needs to</div><div>go to the linux kernel mai=
ling list.</div><div><br></div><div>Cheers,</div><div><br></div><div>Bruce<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Ioan-Adrian Ratiu &lt;<a href=3D"mailto:adrian.ratiu@ni.com"=
>adrian.ratiu@ni.com</a>&gt;<br>
---<br>
=C2=A0tools/merge_config.sh | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/tools/merge_config.sh b/tools/merge_config.sh<br>
index 67d1314..5212f37 100755<br>
--- a/tools/merge_config.sh<br>
+++ b/tools/merge_config.sh<br>
@@ -152,7 +152,10 @@ fi<br>
=C2=A0# alldefconfig: Fills in any missing symbols with Kconfig default<br>
=C2=A0# allnoconfig: Fills in any missing symbols with # CONFIG_* is not se=
t<br>
=C2=A0make KCONFIG_ALLCONFIG=3D$TMP_FILE $OUTPUT_ARG $ALLTARGET<br>
-<br>
+if [ &quot;$?&quot; -ne 0 ]; then<br>
+=C2=A0 =C2=A0 echo &quot;Make failed to fill missing config symbols. Exit.=
&quot; &gt;&amp;2<br>
+=C2=A0 =C2=A0 exit 1<br>
+fi=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0# Check all specified config values took (might have missed-dependenc=
y issues)<br>
=C2=A0for CFG in $(sed -n &quot;$SED_CONFIG_EXP&quot; $TMP_FILE); do<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.9.3<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a1147a29e0db561053b34b611--
