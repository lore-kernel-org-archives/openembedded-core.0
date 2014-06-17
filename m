Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7CB886FFEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 21:22:13 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id hw13so8560920qab.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 14:22:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=OEljZG+USJUHdqQiPMvHCpUJztD5FTz362Ynx8o7aJM=;
	b=TiykbLMDTR5Txkp1lwFHbJpcIhR271GnT0iQLP+gvt63js8Nn9PniItVwwy26v3WC9
	cy6ooZR7+kllNlAu4xD9gsRkEOFzK9Aakcm2o+D3d4Lk5iWsktZe61O5sL1Z7DtCebkn
	dr4/xtk4vopS6pX5Kqbc2h41soRKzSN6mIAMTZhVzY97Lpw4kHmUZ4fMa/4E1N8dF7li
	I5Km7Jnvczgi3ZCb6+5fclwHtOBE9+tSVhVboOsN2IikeWcHIBz+QLYSX0Mx3v1XzIeK
	fJn2XNEDlZ4PQlY5WZATXt+zoB9/UUyZM/yIepcXsmjGvFBjWqnJ95eR9Ti7YX9ijrrJ
	0z2w==
X-Gm-Message-State: ALoCoQlsK4EmwGWfkiZ0V332kNBglXLOKp93Upooz0KBt1FMD16YlRpn46GPdaJRUQkYXg/+S1Zp
X-Received: by 10.140.89.201 with SMTP id v67mr39005552qgd.71.1403040134811;
	Tue, 17 Jun 2014 14:22:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.91.138 with HTTP; Tue, 17 Jun 2014 14:21:54 -0700 (PDT)
In-Reply-To: <53A0A2F0.2020701@gmail.com>
References: <539B27F0.90109@gmail.com>
	<CAJTo0Lauenh9=Mep+4ZUVPnjf0yJDdaCxbrNcB5vXEmtjn5-iA@mail.gmail.com>
	<53A0A2F0.2020701@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Jun 2014 22:21:54 +0100
Message-ID: <CAJTo0La_R6gMKMSbSCKJh6v1exuxxxvsqEHCzzizeL3KYr7jKA@mail.gmail.com>
To: =?UTF-8?Q?Miroslav_Ke=C5=A1?= <miroslav.kes@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: cmake: respect ${S} and ${B} patch problem
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
X-List-Received-Date: Tue, 17 Jun 2014 21:22:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Apart from what Saul said, this looks good to me.

Ross

On 17 June 2014 21:20, Miroslav Ke=C5=A1 <miroslav.kes@gmail.com> wrote:
> On 06/13/14 18:38, Burton, Ross wrote:
>> On 13 June 2014 17:33, Miroslav Ke=C5=A1 <miroslav.kes@gmail.com> wrote:
>>> +    if [ -z "${OECMAKE_SOURCEPATH}" ]; then
>>> +        OECMAKE_SOURCEPATH=3D"${S}"
>>>      fi
>>>
>>>      if [ "${S}" !=3D "${B}" ]; then
>>> @@ -84,7 +88,7 @@ cmake_do_configure() {
>>>
>>>      cmake \
>>>        ${OECMAKE_SITEFILE} \
>>> -      ${S} \
>>> +      ${OECMAKE_SOURCEPATH} \
>> A better idiom that's more self-documenting would be to set
>> OECMAKE_SOURCEPATH ?=3D "${S}" at the top-level.
>>
>> Would it be sensible to give that variable a different name as it
>> refers specifically to the location of the cmake file, and not the
>> rest of the source?
>>
>> Ross
>
> Here is the updated patch:
>
> Signed-off-by: Mira Kes <miroslav.kes@gmail.com>
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index c9c15f3..f762792 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -23,6 +23,9 @@ OECMAKE_RPATH ?=3D ""
>  OECMAKE_PERLNATIVE_DIR ??=3D ""
>  OECMAKE_EXTRA_ROOT_PATH ?=3D ""
>
> +# Path to the CMake file to process.
> +OECMAKE_SOURCEPATH ?=3D "${S}"
> +
>  cmake_do_generate_toolchain_file() {
>         cat > ${WORKDIR}/toolchain.cmake <<EOF
>  # CMake system name must be something like "Linux".
> @@ -65,8 +68,8 @@ EOF
>  addtask generate_toolchain_file after do_patch before do_configure
>
>  cmake_do_configure() {
> -       if [ "${OECMAKE_BUILDPATH}" -o "${OECMAKE_SOURCEPATH}" ]; then
> -               bbnote "cmake.bbclass no longer uses OECMAKE_SOURCEPATH a=
nd OECMAKE_BUILDPATH.  The default behaviour is now out-of-tree builds with=
 B=3DWORKDIR/build."
> +       if [ "${OECMAKE_BUILDPATH}" ]; then
> +               bbnote "cmake.bbclass no longer uses OECMAKE_BUILDPATH.  =
The default behaviour is now out-of-tree builds with B=3DWORKDIR/build."
>         fi
>
>         if [ "${S}" !=3D "${B}" ]; then
> @@ -84,7 +87,7 @@ cmake_do_configure() {
>
>         cmake \
>           ${OECMAKE_SITEFILE} \
> -         ${S} \
> +         ${OECMAKE_SOURCEPATH} \
>           -DCMAKE_INSTALL_PREFIX:PATH=3D${prefix} \
>           -DCMAKE_INSTALL_BINDIR:PATH=3D${bindir} \
>           -DCMAKE_INSTALL_SBINDIR:PATH=3D${sbindir} \
>
>

