Received: from mail-da0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TkyN3-0002Nt-GC
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 15:42:13 +0100
Received: by mail-da0-f45.google.com with SMTP id w4so362140dam.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 06:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=OSHEuCYzz3m0JvmcP3VtUH1p8JqNcu/OVjMNk6iMGtM=;
	b=q9aJDsqi+4S2052Ghrk6n8ZwTJIhktkwZ97EDGbEIOY/xDmyCAs8507HgAWiXDFmqu
	PLC19WNkqNSXQ5OTo4MfHcq0I9QmQVFwmUyAuGgeowqCioOJvXxLpC/neUyRMiKNJLMn
	Li0xxWn3Pd1LWaKQ7rtw0Wtwxx4BN365gDYMiXnwfJX1/7mqeNAbl9w8oWi5sBmZCmov
	qp7Fu1LZWz9kcqHR8UHYa0tHqokoN8i7K3hnAy7XSm1hyRJcDi5qbwge0OESYCx/pQqg
	Hxs65ouVkk5Z072q2OVdjClTs0CLSUEw+UaIkEOmCrIFugs9k9nXmC7iXG7gPIzdY98r
	AMbg==
MIME-Version: 1.0
Received: by 10.68.233.7 with SMTP id ts7mr3615796pbc.136.1355840850553; Tue,
	18 Dec 2012 06:27:30 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.51.193 with HTTP; Tue, 18 Dec 2012 06:27:30 -0800 (PST)
In-Reply-To: <1355839120-12142-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
References: <1355839120-12142-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<1355839120-12142-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
Date: Tue, 18 Dec 2012 12:27:30 -0200
X-Google-Sender-Auth: yvIFdHVVkuXROF2pVdQP-O626VU
Message-ID: <CAP9ODKrLV_GcU-2KRGY0AspXa=Yt4qNVzv_sxPdH+5sjh8NcJw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
Cc: Lukas Bulwahn <lukas.bulwahn@bmw-carit.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] easyinstall: class to create and extend the easyinstall.pth file
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
X-List-Received-Date: Tue, 18 Dec 2012 14:42:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 18, 2012 at 11:58 AM, Lukas Bulwahn
<lukas.bulwahn@oss.bmw-carit.de> wrote:
> From: Lukas Bulwahn <lukas.bulwahn@bmw-carit.de>
>
> When installing python packages that are installed with python's easyinstall,
> the installation creates easyinstall.pth files. This file must exist in the
> root filesystem so that python 2.7 can locate and import the installed modules
> in the host system.
>
> Due to the import of the changeset aaaac4c545623d8818de2d3fa71d9d63b717c575
> from the Classic OpenEmbedded Development Tree in changeset
> 733dc27ecf485a0ec5318534dfbbc9491c08df8f, the easyinstall.pth file is removed.
> The original changeset claims that python 2.5 can import packages without the
> easyinstall.pth file. However in my experience, python 2.7 cannot import
> packages without this file. Furthermore, the easyinstall.pth file must
> accumulate entries when multiple packages are installed with easyinstall.
>
> The easyinstall class provides a simple postinst script that adds the content
> of the variable EASYINSTALL_${PN} to the easyinstall.pth file and initializes
> the file if necessary.
> ---
>  meta/classes/easyinstall.bbclass |   11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta/classes/easyinstall.bbclass
>
> diff --git a/meta/classes/easyinstall.bbclass b/meta/classes/easyinstall.bbclass
> new file mode 100644
> index 0000000..8ae975d
> --- /dev/null
> +++ b/meta/classes/easyinstall.bbclass
> @@ -0,0 +1,11 @@
> +
> +pkg_postinst_${PN} () {
> +       if test ! -e ${PYTHON_SITEPACKAGES_DIR}/easy-install.pth; then
> +            cat > ${PYTHON_SITEPACKAGES_DIR}/easy-install.pth << EOF
> +import sys; sys.__plen = len(sys.path)
> +import sys; new=sys.path[sys.__plen:]; del sys.path[sys.__plen:]; p=getattr(sys,'__egginsert',0); sys.path[p:p]=new; sys.__egginsert = p+len(new)

All this need to be in a single line? Seems ugly and hard to read for me.

> +EOF
> +        fi
> +        sed -i '$ i ${EASYINSTALL_${PN}}' ${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
> +}
> +
> --
> 1.7.9.5
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


