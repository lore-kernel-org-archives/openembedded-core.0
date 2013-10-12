Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3C2BE6CF9C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2013 02:03:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9C23xCP000670
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 19:03:59 -0700 (PDT)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Fri, 11 Oct 2013 19:03:55 -0700
Message-ID: <5258AE27.3070504@windriver.com>
Date: Sat, 12 Oct 2013 10:04:23 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <52580CC0.10808@communistcode.co.uk>
In-Reply-To: <52580CC0.10808@communistcode.co.uk>
X-Originating-IP: [128.224.162.213]
Subject: Re: Setting root password
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
X-List-Received-Date: Sat, 12 Oct 2013 02:03:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2013 10:35 PM, Jack Mitchell wrote:
> What is the best way to set the root password for an image during build
> time?
>
> I have come across this snippet:
>
> ROOTFS_POSTPROCESS_COMMAND += " \
>          sed 's%^root:[^:]*:%root:${PASSWD}:%' \
>          < ${IMAGE_ROOTFS}/etc/shadow \
>          > ${IMAGE_ROOTFS}/etc/shadow.new;\
>          mv ${IMAGE_ROOTFS}/etc/shadow.new ${IMAGE_ROOTFS}/etc/shadow ;"
>
> but it feels a bit hacky... is there no defined way to do this cleanly?
>
> Cheers,
> Jack.
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
What about using EXTRA_USERS_PARAMS?

E.g.
1. Get the encrypted password.
(One way to get the encrypted password is using openssl, of course you 
can use other methods.)
openssl passwd -1 root
$1$QauDU/Ig$KEeg.OaCLFkNwSXW4xYRu1


2. Add to local.conf the following lines. Note the '$' sign should be 
escaped.

INHERIT += "extrausers"
EXTRA_USERS_PARAMS = "usermod -p '\$1\$QauDU/Ig\$KEeg.OaCLFkNwSXW4xYRu1' root;"


Best Regards,
Chen Qi

