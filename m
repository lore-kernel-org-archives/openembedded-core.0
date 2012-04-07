Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SGOWe-0004Gi-4G
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Apr 2012 07:49:28 +0200
Received: by pbcum15 with SMTP id um15so2651210pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 22:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=jsxWdPBgGeBu3GvPc7voCcTnjPyQF4xnCqkwDnrQpjg=;
	b=OM2NxFnVN6J1VZjmZGtqXqBZL2A1EGKG/N6qJqFe79aY5P0UDncF30kW0WMYAVfcVu
	xYNA9TDtLH+HMFuFyTG6Hb/vxjilsQxHif4W/RThAM8Kn5qS3PL0Mzd3AB9SdEQLUqbv
	f9EKmcKX9EzSvncitIpvsJM0Lca7eLII+41xTKx+zHLMMXYZbdXSeOjDqHU2lGXktgwl
	OfCUpFwYzPb5BnT1dtmZrDM+1U2ZLMIVgaZW+9XUCOeVSwbolAlUeNyyf9psvc81GzkO
	th0TrYA85bU2TQqAOBwi4GI78wWgYK3oBBLYADFqViVmfq3dFwdQokJVyH7J/oqVHEW9
	qe5A==
Received: by 10.68.193.161 with SMTP id hp1mr1341511pbc.106.1333777213447;
	Fri, 06 Apr 2012 22:40:13 -0700 (PDT)
Received: from [192.168.1.79] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id 2sm8262213pbw.57.2012.04.06.22.40.11
	(version=SSLv3 cipher=OTHER); Fri, 06 Apr 2012 22:40:12 -0700 (PDT)
Message-ID: <4F7FD33A.9070801@gmail.com>
Date: Fri, 06 Apr 2012 22:40:10 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120402 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1332877869-12195-1-git-send-email-kergoth@gmail.com>
	<1332877869-12195-2-git-send-email-kergoth@gmail.com>
In-Reply-To: <1332877869-12195-2-git-send-email-kergoth@gmail.com>
X-Enigmail-Version: 1.4
Subject: Re: [PATCH 2/3] powerpc e500: set -mfloat-gprs=double
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 07 Apr 2012 05:49:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03/27/2012 12:51 PM, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> Use of FPRs instead of GPRs is incompatible with e500/SPE, so let's
> be explicit about the use of GPRs to avoid potential errors. For
> example, with the Sourcery G++ toolchain, one can hit:
> conftest.c:1:0: error: E500 and FPRs not supported.
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com> --- 
> meta/conf/machine/include/tune-ppce500.inc   |    2 +- 
> meta/conf/machine/include/tune-ppce500v2.inc |    2 +- 2 files
> changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/machine/include/tune-ppce500.inc
> b/meta/conf/machine/include/tune-ppce500.inc index 1326720..feb1967
> 100644 --- a/meta/conf/machine/include/tune-ppce500.inc +++
> b/meta/conf/machine/include/tune-ppce500.inc @@ -7,7 +7,7 @@
> TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500",
> "-mcpu=8540", " TUNE_PKGARCH_tune-ppce500 = "ppce500"
> 
> TUNEVALID[spe] = "Enable SPE ABI extensions" -TUNE_CCARGS +=
> "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe",
> "", d)}" +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES",
> "spe", "-mabi=spe -mspe -mfloat-gprs=double", "", d)}"
> 

IIRC e500v1 does not have double precision floating point support.


> TARGET_FPU = "ppc-efs"
> 
> diff --git a/meta/conf/machine/include/tune-ppce500v2.inc
> b/meta/conf/machine/include/tune-ppce500v2.inc index
> e7b51c6..f0158d0 100644 ---
> a/meta/conf/machine/include/tune-ppce500v2.inc +++
> b/meta/conf/machine/include/tune-ppce500v2.inc @@ -7,7 +7,7 @@
> TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2",
> "-mcpu=8548", TUNE_PKGARCH_tune-ppce500v2 = "ppce500v2"
> 
> TUNEVALID[spe] = "Enable SPE ABI extensions" -TUNE_CCARGS +=
> "${@bb.utils.contains("TUNE_FEATURES", "spe", "-mabi=spe -mspe",
> "", d)}" +TUNE_CCARGS += '${@bb.utils.contains("TUNE_FEATURES",
> "spe", "-mabi=spe -mspe -mfloat-gprs=double", "", d)}'
> 
> TARGET_FPU = "ppc-efd"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk9/0zkACgkQuwUzVZGdMxTMYQCfbnz0j7H+ypE8hRTHoQOuLaCR
PcwAn3H5jeibd9N4TzKQdyYh9MiwV0F9
=J93c
-----END PGP SIGNATURE-----


