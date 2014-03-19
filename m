Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1703B6D8C7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 11:20:05 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id d49so6446389eek.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 04:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=BfXtEvdJcpfsa0Bs3CyrJtAvs1lbjjRjg5A6Ka7U4LU=;
	b=UDPeA5/Fd4KTHmzQLM3xPeMfo1kPsj66g2W94AlWvQ+Jsl8bliD7WFyvaPfnVbyngt
	6g550o/fiK/qaProfWCSZVrDrige20uT6Rz7rNctlIiuNIn8ur5t9p+GuC/SKnDcsSS+
	ONt+bEGqU4BLKlaEJnPidAlTYBrg1wiWnLokKKtqjy88Wr6s33dLbgOwLrzyTcqXTjW6
	5ZXsx3CQ00emqOAeyhUX4FKuxxQAdi+MqrhBU0Bj9ODUVXVHLrmFhJoj0zc0sJpqG4xK
	z7jv+3HPbB8OGVjykzM0cROpOr+YBgCHqLdIfs97F/YMsOMSTuIkh+k/x8UPbeDq4h4T
	iCUw==
X-Gm-Message-State: ALoCoQnYQyjckpKLvAFZy+jTMt/wx5pYB0uTCHhUTeuOxzSvl9Y2MAH3QOSWSSx4xmbQZKEv/Jrl
X-Received: by 10.14.224.6 with SMTP id w6mr36025179eep.60.1395228005416;
	Wed, 19 Mar 2014 04:20:05 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	l42sm54011637eew.19.2014.03.19.04.20.03 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Mar 2014 04:20:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1395189079-18831-1-git-send-email-sgw@linux.intel.com>
Date: Wed, 19 Mar 2014 12:20:02 +0100
Message-Id: <E29EEF7C-83DE-4EF0-84D9-C8E1BE71C9F3@dominion.thruhere.net>
References: <1395189079-18831-1-git-send-email-sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] testimage: dont use DNS lookup for qemu based testimages
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
X-List-Received-Date: Wed, 19 Mar 2014 11:20:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 mrt. 2014, om 01:31 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/classes/testimage.bbclass | 10 ++++++++++
> 1 file changed, 10 insertions(+)
>=20
> diff --git a/meta/classes/testimage.bbclass =
b/meta/classes/testimage.bbclass
> index 691c7f6..ee028e1 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -45,6 +45,16 @@ TESTIMAGEDEPENDS_qemuall =3D =
"qemu-native:do_populate_sysroot qemu-helper-native:d
> TESTIMAGELOCK =3D "${TMPDIR}/testimage.lock"
> TESTIMAGELOCK_qemuall =3D ""
>=20
> +IMAGE_POSTPROCESS_COMMAND_qemuall +=3D "fix_dns_lookup_for_qemu"

Overrides and +=3D don't do what you expect most of the time, =
_append_qemuall =3D " fix_dns_lookup_for_qemu" is a safer way to specify =
this. But more importantly, you're missing the trailing semicolon :)=20

	IMAGE_POSTPROCESS_COMMAND_append_qemuall =3D " =
fix_dns_lookup_for_qemu ;"

regards,

Koen

> +
> +fix_dns_lookup_for_qemu() {
> +	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
> +		sed -i -e 's:#UseDNS yes:UseDNS no:' =
${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
> +	fi
> +}
> +
> +EXPORT_FUNCTIONS fix_dns_lookup_for_qemu
> +
> python do_testimage() {
>     testimage_main(d)
> }
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


