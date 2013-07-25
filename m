Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9CA7960FEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 11:08:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6PB8Fvi028205
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 04:08:15 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 25 Jul 2013 04:08:13 -0700
Message-ID: <51F1071E.4040304@windriver.com>
Date: Thu, 25 Jul 2013 19:08:14 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1374573823-27458-1-git-send-email-muhammad_shakeel@mentor.com>
In-Reply-To: <1374573823-27458-1-git-send-email-muhammad_shakeel@mentor.com>
X-Originating-IP: [128.224.162.233]
Subject: Re: [PATCH] systemd: Remove init.d dir if systemd unit file is present and sysvinit not a distro feature
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
X-List-Received-Date: Thu, 25 Jul 2013 11:08:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/23/2013 06:03 PM, Shakeel, Muhammad wrote:
> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>
> If systemd is supported DISTRO_FEATURE and sysvinit is not and also if
> systemd_unitdir contains a service file(s) then no need to keep init.d scripts
> for sysvinit compatibility.
>
> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> ---
>   meta/classes/systemd.bbclass |   19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
> index 9763faa..55f378e 100644
> --- a/meta/classes/systemd.bbclass
> +++ b/meta/classes/systemd.bbclass
> @@ -170,3 +170,22 @@ python rm_systemd_unitdir (){
>               shutil.rmtree(systemd_unitdir)
>   }
>   do_install[postfuncs] += "rm_systemd_unitdir "
> +
> +python rm_sysvinit_initddir (){
> +    import shutil
> +    if ("systemd" in d.getVar("DISTRO_FEATURES", True).split() and
> +        "sysvinit" not in d.getVar("DISTRO_FEATURES", True).split()):
> +        service_file_exists = False
> +        systemd_unitdir = oe.path.join(d.getVar("D", True), d.getVar('systemd_unitdir', True), "system")
> +        if os.path.exists(systemd_unitdir):
> +            for filename in os.listdir(systemd_unitdir):
> +                if filename.endswith(".service"):
> +                    service_file_exists = True
> +                    break
> +
> +        if service_file_exists:
> +            sysv_initddir = oe.path.join(d.getVar("D", True), d.getVar('INIT_D_DIR', True))
> +            if os.path.exists(sysv_initddir):
> +                shutil.rmtree(sysv_initddir)
> +}
> +do_install[postfuncs] += "rm_sysvinit_initddir "
Hi,

I just tried this patch out.
It resulted in the following warning.

WARNING: busybox: NOT adding alternative provide /etc/init.d/syslog: 
/etc/init.d/syslog.busybox does not exist

I know this warning is harmless. But it's still somewhat misleading. So 
are we going to do something about it?

//Chen Qi

//Chen Qi

