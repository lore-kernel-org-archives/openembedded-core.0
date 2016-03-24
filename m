Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5C5496012C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 18:03:33 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id av4so126853036igc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 11:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=czYuI2ymRZx2EdzxDDZ7dMh8ZH9r016Zri0plpr8S4E=;
	b=qJ4InpQ/yTFq8fRFtFFSzsg681oePNIvwxl6Rv871IoI+lJx5HQGnmOO17gNr+1cm5
	PaaOYE/ywERFciKTDphFXUOuv0wxhAR5fRCcSts53cDel4cZpE124Sa6vEyBJmPlmpvI
	OI0LngOlBbR59zLt9Xmbf2fsicVXAGP9h69o7SvFdGtK4Exm/9KBwo/4gjLXXlFIAXKf
	uCGEi7FlQ0fsBY1S72YxCEIQY3RBFqfKZuSeyFrUNJhmcJN/wYsW1d4QjCQesqXQsuyv
	QzjTl2U3azPKMDo6/7Wt9i+ZQ6UtphhqjH2CE4wAEitHNEUKWvm8/UagAdtvrpgMcuzH
	3Gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=czYuI2ymRZx2EdzxDDZ7dMh8ZH9r016Zri0plpr8S4E=;
	b=EvQE7PZW5laYS2Biwcdgg3csg41hsBMqry4cGCiKsJ8o1TiIDW/BiAlG5Vrka6jaJX
	gk9HC0GvaDr91uCyk3uyjAVZ4Y8TGJkD8AOsHujPc7W+Ng+FQpZI8fsN6MszyCfFjf9V
	S+MBX+wIM0XbT54YuTqqcmC6WZomITRkHPArwxVwsn3RqBUbuc8eS+PGnx6vieQnZzag
	siZzzXaVo9aLoeBpZurhNQhcUGihogWuIGoKJiTAu1qL8gUnwY3VNd0e349iE6lni87f
	bIXETHCPhVg+oxWCTgBboIgUDhyjp66kYinNQhqR/j9elEWSn8tCc3UYowuKudSzJpp7
	Ox8w==
X-Gm-Message-State: AD7BkJK5LkhMZ1Q2Smyes2cFEEQbAntUwb+pxZbLpiR6AdTnWatIghBlJW7zn0wz/hr8itrdt6oDdNhBYBHNoA==
X-Received: by 10.51.17.34 with SMTP id gb2mr31187942igd.13.1458842614399;
	Thu, 24 Mar 2016 11:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <1458841762-9002-1-git-send-email-armccurdy@gmail.com>
In-Reply-To: <1458841762-9002-1-git-send-email-armccurdy@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 24 Mar 2016 18:03:25 +0000
Message-ID: <CABcZAN=Xg--fNjRVKWTSC2pkPnyVLHN+Vz++a07xq-sorC534w@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] oe-buildenv-internal: simplify derivation of BB_ENV_EXTRAWHITE
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
X-List-Received-Date: Thu, 24 Mar 2016 18:03:35 -0000
Content-Type: multipart/alternative; boundary=001a1135ed32d0ae48052ecf433b

--001a1135ed32d0ae48052ecf433b
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 24, 2016 at 10:49 AM Andre McCurdy <armccurdy@gmail.com> wrote:

> Use 'sort --unique' to combine the two lists and remove duplicates.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  scripts/oe-buildenv-internal | 23 +++--------------------
>  1 file changed, 3 insertions(+), 20 deletions(-)
>
> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
> index 8eee008..be212f2 100755
> --- a/scripts/oe-buildenv-internal
> +++ b/scripts/oe-buildenv-internal
> @@ -110,29 +110,12 @@ unset BITBAKEDIR newpath
>  export BUILDDIR
>  export PATH
>
> -add_extrawhite() {
> -    # If the current shell is zsh, then temporarily set it to emulate sh
> in this
> -    # function so that the for and case statements below work as expected.
> -    [ -z "$ZSH_NAME" ] || emulate -L sh
> -
> -    local extrawhite="MACHINE DISTRO TCMODE TCLIBC HTTP_PROXY http_proxy \
> +BB_ENV_EXTRAWHITE_OE="MACHINE DISTRO TCMODE TCLIBC HTTP_PROXY http_proxy \
>  HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy FTPS_PROXY ftps_proxy
> ALL_PROXY \
>  all_proxy NO_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY \
>  SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE
> GIT_PROXY_COMMAND \
>  SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR"
>
> -    local var
> -    for var in $extrawhite; do
> -        case " $BB_ENV_EXTRAWHITE " in
> -            *[[:blank:]]$var[[:blank:]]*)
> -                ;;
> -            *)
> -
> BB_ENV_EXTRAWHITE="${BB_ENV_EXTRAWHITE:+$BB_ENV_EXTRAWHITE }$var"
> -                ;;
> -        esac
> -    done
> -}
> -
> -add_extrawhite
> -unset -f add_extrawhite
> +BB_ENV_EXTRAWHITE=$(echo $BB_ENV_EXTRAWHITE $BB_ENV_EXTRAWHITE_OE | sed
> 's/ /\n/g' | LC_ALL=C sort --unique)
>

You could use this instead of sed here: tr ' ' '\n'

--001a1135ed32d0ae48052ecf433b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu=
, Mar 24, 2016 at 10:49 AM Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gm=
ail.com">armccurdy@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">Use &#39;sort --unique&#39; to combine the two lists and remove du=
plicates.<br>
<br>
Signed-off-by: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com" tar=
get=3D"_blank">armccurdy@gmail.com</a>&gt;<br>
---<br>
=C2=A0scripts/oe-buildenv-internal | 23 +++--------------------<br>
=C2=A01 file changed, 3 insertions(+), 20 deletions(-)<br>
<br>
diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal<br=
>
index 8eee008..be212f2 100755<br>
--- a/scripts/oe-buildenv-internal<br>
+++ b/scripts/oe-buildenv-internal<br>
@@ -110,29 +110,12 @@ unset BITBAKEDIR newpath<br>
=C2=A0export BUILDDIR<br>
=C2=A0export PATH<br>
<br>
-add_extrawhite() {<br>
-=C2=A0 =C2=A0 # If the current shell is zsh, then temporarily set it to em=
ulate sh in this<br>
-=C2=A0 =C2=A0 # function so that the for and case statements below work as=
 expected.<br>
-=C2=A0 =C2=A0 [ -z &quot;$ZSH_NAME&quot; ] || emulate -L sh<br>
-<br>
-=C2=A0 =C2=A0 local extrawhite=3D&quot;MACHINE DISTRO TCMODE TCLIBC HTTP_P=
ROXY http_proxy \<br>
+BB_ENV_EXTRAWHITE_OE=3D&quot;MACHINE DISTRO TCMODE TCLIBC HTTP_PROXY http_=
proxy \<br>
=C2=A0HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy FTPS_PROXY ftps_proxy ALL=
_PROXY \<br>
=C2=A0all_proxy NO_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POL=
ICY \<br>
=C2=A0SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE GIT_PROXY_CO=
MMAND \<br>
=C2=A0SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR&quot;<br>
<br>
-=C2=A0 =C2=A0 local var<br>
-=C2=A0 =C2=A0 for var in $extrawhite; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case &quot; $BB_ENV_EXTRAWHITE &quot; in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *[[:blank:]]$var[[:blank:]]*)<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BB_ENV_EXTRAWHITE=
=3D&quot;${BB_ENV_EXTRAWHITE:+$BB_ENV_EXTRAWHITE }$var&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
-=C2=A0 =C2=A0 done<br>
-}<br>
-<br>
-add_extrawhite<br>
-unset -f add_extrawhite<br>
+BB_ENV_EXTRAWHITE=3D$(echo $BB_ENV_EXTRAWHITE $BB_ENV_EXTRAWHITE_OE | sed =
&#39;s/ /\n/g&#39; | LC_ALL=3DC sort --unique)<br></blockquote><div><br></d=
iv><div>You could use this instead of sed here: tr &#39; &#39; &#39;\n&#39;=
</div></div></div>

--001a1135ed32d0ae48052ecf433b--
