Received: from mail-ob0-f169.google.com ([209.85.214.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U0Azt-0001nP-90
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 14:13:10 +0100
Received: by mail-ob0-f169.google.com with SMTP id ta14so371057obb.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 04:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=7nUk20RpAAURoNQHuSrGjGQ/FX5pzK7mh1D7uk167r8=;
	b=eCRPVDOgbXziSqhSRwe9g+VGOizVXUSQal3b24vRVshN5VzE5lyj0WxYPUMusAD8v5
	A22KZ9o8H+7nxsUpZIu5FeAtN1PRrCUMKPqk04y9RuQy6WSofJux2DE5NtGIjle7wfJX
	3jY4p54OAPGflcPjyZnVy+8ygBKIQPm8GEDZwDkJxSike0OWLX+L/C5cZTZ7JwtzBVNb
	m6DghxXvTlKBm0xs9otKC7TopNiZlk3Ro2C67LOUnkmaT3L09vU3V5mK06NgEUgu8WH2
	B1/Mht5D1TEWOEzsriIiKR4EHzAu4Hrq6PUA/2cBj0HYElzuPYn6O/Y0y1+MMRCn+oJ6
	9/xw==
MIME-Version: 1.0
X-Received: by 10.60.1.8 with SMTP id 8mr630761oei.42.1359464248981; Tue, 29
	Jan 2013 04:57:28 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Tue, 29 Jan 2013 04:57:28 -0800 (PST)
In-Reply-To: <1359463060-12321-1-git-send-email-Martin.Jansa@gmail.com>
References: <1359463060-12321-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 29 Jan 2013 10:57:28 -0200
X-Google-Sender-Auth: 4dBYduigYIIx2fr2es3ACaMJOh0
Message-ID: <CAP9ODKqU5gaCQHi8pseZ3GDVduCxORMDZFZxJSiO4mapJop3xw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] license: fix LICENSE_CREATE_PACKAGE to stay disabled by default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 13:13:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 29, 2013 at 10:37 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * as reported by Enrico on #oe
>   11:06:50 < ensc|w> JaMa: might this be caused by dc78ef91a2bf01efb8028c9afbe69e506e016265
>   which checks for 'd.getVar('LICENSE_CREATE_PACKAGE', True)' evaluating to 'True' for every
>   string (including the default 0)
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/license.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index d4ebb26..9f38221 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -103,7 +103,7 @@ python do_populate_lic() {
>  # it would be better to copy them in do_install_append, but find_license_filesa is python
>  python perform_packagecopy_prepend () {
>      enabled = d.getVar('LICENSE_CREATE_PACKAGE', True)
> -    if d.getVar('CLASSOVERRIDE', True) == 'class-target' and enabled:
> +    if d.getVar('CLASSOVERRIDE', True) == 'class-target' and enabled and enabled == "1":
>          lic_files_paths = find_license_files(d)

Uh?!? ... and enabled and enabled == "1"? You can drop the first no?

>          # LICENSE_FILES_DIRECTORY starts with '/' so os.path.join cannot be used to join D and LICENSE_FILES_DIRECTORY
> --
> 1.8.1.2
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


