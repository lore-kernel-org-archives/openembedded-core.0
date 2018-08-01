Return-Path: <omar.ocampo.coronado@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B28B078CC1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2018 22:46:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Aug 2018 15:46:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,433,1526367600"; d="scan'208";a="59728198"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
	by fmsmga008.fm.intel.com with ESMTP; 01 Aug 2018 15:46:25 -0700
Received: from fmsmsx158.amr.corp.intel.com (10.18.116.75) by
	FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Wed, 1 Aug 2018 15:46:25 -0700
Received: from FMSMSX109.amr.corp.intel.com ([169.254.15.66]) by
	fmsmsx158.amr.corp.intel.com ([169.254.15.57]) with mapi id
	14.03.0319.002; Wed, 1 Aug 2018 15:46:25 -0700
From: "Ocampo Coronado, Omar" <omar.ocampo.coronado@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Strip kernel modules and signatures
Thread-Index: AdQp6AYNoEgkmdwwQ7movNFM8K8/Og==
Date: Wed, 1 Aug 2018 22:46:24 +0000
Message-ID: <0D62475714C01347BCA118AE7A61400376B2C64D@FMSMSX109.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiY2Q4NjU1ODItNTk0NS00NjRmLWFjOTAtMWEwY2I4MjIwZmEwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiaHNrcjBEUjBOOG9BV3d0M0JkWU8yMVA5U0xpeFFzR2JGRWlHVXZyN1M4MHZwU3lRRVlabDhMWFkwVlNIK1NNNCJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.1.200.106]
MIME-Version: 1.0
Subject: Strip kernel modules and signatures
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
X-List-Received-Date: Wed, 01 Aug 2018 22:46:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello OE,

While attempting to sign our kernel modules (using the kernel configuration=
  CONFIG_MODULE_SIG) the drivers in our image did not have the signature, e=
ven the certificate was being loaded by the kernel or the driver being sign=
ed during do_install().

Turns out package.bbclass, while it ignores to create debug info files it d=
oes strips the kernel modules files:

python split_and_strip_files () {
	...
	...
	        for f in kernmods:
                          sfiles.append((f, 16, strip))

        oe.utils.multiprocess_exec(sfiles, oe.package.runstrip)
    #
    # End of strip
    #
    os.chdir(oldcwd)
}

The strip is required for many reasons yet it removes the signature which w=
e want to preserve in this scenario.
To work around this issue add
     INHIBIT_PACKAGE_STRIP =3D "1"
     either on your virtual/kernel bb file or driver bb file.

Hope this helps someone in the future when adding signature to files, perha=
ps including this into the Yocto kernel development manual.

Cheers

P.S.
In a linux-intel kernel (master) without stripped kernel modules the image =
size increased in 650kb.=20

