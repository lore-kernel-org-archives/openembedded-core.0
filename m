Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id AA93A77016
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 12:23:51 +0000 (UTC)
Received: by wibz8 with SMTP id z8so15899734wib.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 05:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZS+LfY4uJBP/+KFPsb+udPDHD55LfShRwHNifnJYhMc=;
	b=XCbenkHwsDdm/dponXu7wx5pyHayMRVHQU4ftfSAkpB2QEXUU869tBHlDQUhZtvYIC
	8X/jfDegVYACArsTZApMBycvaae82Cy6PWF/Ijs7z/jx4ixtzamq7/E24bQpXUqwOBPC
	k/wj+2ATXudu4Prcqsc5Tg0bWSjeV6a58yZe1xQ9Eom+ZweB50vK6pqETJ9kmupr+pBY
	NXlpDdnAOolAy2bSQ9yHLiglj3VQGNGoE7lZZ6d4rD8ab1uQ3k39jI6xuQtJ7ccgVEVm
	uLmnTUU9JW7svZFIBzEO9ZKjkkFe9uMjOTtiTZ9LH1uLM8DPIj5ReQxwXmjd/s4UcMI2
	ri1A==
X-Received: by 10.180.38.110 with SMTP id f14mr6914326wik.62.1441369431378;
	Fri, 04 Sep 2015 05:23:51 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ir5sm3790464wjb.23.2015.09.04.05.23.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Sep 2015 05:23:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 4 Sep 2015 14:24:23 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20150904122423.GA2457@jama>
References: <1441369329-32134-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1441369329-32134-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] report-error: send only last 5242000 characters in error logs
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
X-List-Received-Date: Fri, 04 Sep 2015 12:23:53 -0000
X-Groupsio-MsgNum: 70654
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline

--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2015 at 02:22:09PM +0200, Martin Jansa wrote:
> * otherwise whole build report submission is rejected because it's too big

Verified in last bitbake world build:
http://errors.yoctoproject.org/Errors/Build/8516/
until now they were rejected because webkit-efl log.do_compile is too
big, now it's uploades in shortened form:
http://errors.yoctoproject.org/Errors/Details/16393/

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/report-error.bbclass | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-erro=
r.bbclass
> index cabd98c..040c29e 100644
> --- a/meta/classes/report-error.bbclass
> +++ b/meta/classes/report-error.bbclass
> @@ -54,13 +54,22 @@ python errorreport_handler () {
>              if log:
>                  try:
>                      logFile =3D open(log, 'r')
> -                    taskdata['log'] =3D logFile.read().decode('utf-8')
> +                    logdata =3D logFile.read().decode('utf-8')
>                      logFile.close()
>                  except:
> -                    taskdata['log'] =3D "Unable to read log file"
> +                    logdata =3D "Unable to read log file"
> =20
>              else:
> -                taskdata['log'] =3D "No Log"
> +                logdata =3D "No Log"
> +
> +            # server will refuse failures longer than param specified in=
 project.settings.py
> +            # MAX_UPLOAD_SIZE =3D "5242880"
> +            # use lower value, because 650 chars can be spent in task, p=
ackage, version
> +            max_logdata_size =3D 5242000
> +            # upload last max_logdata_size characters
> +            if len(logdata) > max_logdata_size:
> +                logdata =3D "..." + logdata[-max_logdata_size:]
> +            taskdata['log'] =3D logdata
>              lock =3D bb.utils.lockfile(datafile + '.lock')
>              jsondata =3D json.loads(errorreport_getdata(e))
>              jsondata['failures'].append(taskdata)
> --=20
> 2.5.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXpjXEACgkQN1Ujt2V2gBwI6gCdGNsd+fQM2pxHDt9/x9ASHRji
cUQAn2Uw83fW7wCxG49S8azZh0boRWsD
=UM+1
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
