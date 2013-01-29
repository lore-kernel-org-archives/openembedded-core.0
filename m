Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1U07Kk-0001NB-7P
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 10:18:57 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0T92kIY022590
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 01:02:46 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 29 Jan 2013 01:02:45 -0800
Message-ID: <5107904A.3000802@windriver.com>
Date: Tue, 29 Jan 2013 17:03:06 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1358840606.git.Qi.Chen@windriver.com>
	<5229d2b8caba239e8140288a51b2c9c2d6487567.1358840606.git.Qi.Chen@windriver.com>
In-Reply-To: <5229d2b8caba239e8140288a51b2c9c2d6487567.1358840606.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.163.154]
Subject: Re: [PATCH 1/1] rootfs_rpm.bbclass: fix the unexpected postinst error
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
X-List-Received-Date: Tue, 29 Jan 2013 09:19:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Really really sorry that this patch introduces a bug :(
(It built and booted correctly, so I thought everything's OK. I didn't 
check the do_rootfs log.)
A follow-up patch has been sent.
Sorry for the inconvenience.

Chen Qi

On 01/22/2013 04:44 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> If the /etc/rpm-postinsts/ directory was empty, the following error
> would occur at system startup.
>
>        ERROR: postinst /etc/rpm-postinsts/* failed
>
> This patch fixes this issue.
>
> [YOCTO #3767]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/classes/rootfs_rpm.bbclass |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
> index 7d789cc..accd7d9 100644
> --- a/meta/classes/rootfs_rpm.bbclass
> +++ b/meta/classes/rootfs_rpm.bbclass
> @@ -108,7 +108,8 @@ fakeroot rootfs_rpm_do_rootfs () {
>   	i=\$i
>   	cat > ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts << EOF
>   #!/bin/sh
> -for i in /etc/rpm-postinsts/*; do
> +for i in `ls /etc/rpm-postinsts/`; do
> +	i=/etc/rpm-postinsts/$i
>   	echo "Running postinst $i..."
>   	if [ -f $i ] && $i; then
>   		rm $i



