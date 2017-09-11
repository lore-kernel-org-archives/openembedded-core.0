Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E562D77DC8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 01:38:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8B1ctiT019679
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Sep 2017 18:38:55 -0700 (PDT)
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Sun, 10 Sep 2017 18:38:54 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1504604362.git.Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <57cda092-cad9-c47c-8205-bfc0cff388b5@windriver.com>
Date: Mon, 11 Sep 2017 09:44:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1504604362.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.167]
Subject: Re: [PATCH 0/2] disallow multiple syslog daemons to be installed
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
X-List-Received-Date: Mon, 11 Sep 2017 01:38:55 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 09/05/2017 05:55 PM, Chen Qi wrote:
> In OE core, we had the assumption that multiple syslog daemons could be installed
> at the same time. We did some work to cope with this assumption, including
> using update-alternatives to manage syslog related files.
>
> In meta-openembedded, rsyslog and syslog-ng have already set RCONFLICTS to avoid
> being installed with other syslog daemons.
>
> Checking Fedora and Ubuntu, they both disallow installation of multiple syslog
> daemons. (For other distros, I haven't checked.)
>
> I support forbidding installing multiple syslog daemons. Reasons are below.
> 1) It makes things simpler and cleaner.
> 2) It doesn't make much sense to install multiple syslog daemons.
> 3) Our current implementation has some problems. One of them is that the
>     /etc/systemd/system/syslog.service symlink is determined by the installation
>     order of syslog daemons, while other syslog related files including syslog
>     configuration files are determined by update-alternatives mechanism.
>     For more info for the /etc/systemd/system/syslog.service symlink, please
>     refer to https://www.freedesktop.org/wiki/Software/systemd/syslog/.
>
> These two patches fix busybox and sysklogd to disallow installing multiple syslog
> daemons.
>
> The following changes since commit ee5bce2d11e783c0921df47b629025a6b67c44bf:
>
>    kernel-dev: Removed bad reference for creating patches. (2017-09-02 00:52:49 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib ChenQi/syslog-conflicts
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/syslog-conflicts
>
> Chen Qi (2):
>    busybox: fix syslog related meta data
>    sysklogd: conflict with other syslog daemons
>
>   meta/recipes-core/busybox/busybox.inc       | 27 +++++++--------------------
>   meta/recipes-extended/sysklogd/sysklogd.inc | 12 ++++--------
>   2 files changed, 11 insertions(+), 28 deletions(-)
>


