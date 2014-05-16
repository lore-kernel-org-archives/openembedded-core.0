Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 430BB6028A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 02:05:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4G25LgL019136
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 15 May 2014 19:05:23 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Thu, 15 May 2014 19:05:21 -0700
Message-ID: <53757279.3020908@windriver.com>
Date: Fri, 16 May 2014 10:05:45 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, Khem Raj <raj.khem@gmail.com>
References: <1400099434-22527-1-git-send-email-otavio@ossystems.com.br>	<CAMKF1srwzW+pU4K2wgSG6GPmRGmGdGqCbaJi34ZjF0Npi4TOcQ@mail.gmail.com>
	<CAP9ODKrwxJ85rn5sPqaW7cvu3cu0+NFcgHOL_My3oUWR1dok5A@mail.gmail.com>
In-Reply-To: <CAP9ODKrwxJ85rn5sPqaW7cvu3cu0+NFcgHOL_My3oUWR1dok5A@mail.gmail.com>
X-Originating-IP: [128.224.162.187]
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH 1/4] tcf-agent: add systemd support
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
X-List-Received-Date: Fri, 16 May 2014 02:05:31 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/15/2014 08:24 PM, Otavio Salvador wrote:
> On Wed, May 14, 2014 at 7:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Wed, May 14, 2014 at 1:30 PM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
>>> +       install -d ${D}${systemd_unitdir}/system
>>> +       install -m 0644 ${WORKDIR}/tcf-agent.service ${D}${systemd_unitdir}/system
>>> +       sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/tcf-agent.service
>> shouldn't this happened if systemd is enabled in distro
> Agreed. Added Chen Qi in Cc.
>

In systemd.bbclass, there's function to remove things under 
${systemdunitdir} if 'systemd' is not in DISTRO_FEATURES. So I think 
there's no need to add a check here.

Below are the related codes.

python rm_systemd_unitdir (){
     import shutil
     if not bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
         systemd_unitdir = oe.path.join(d.getVar("D", True), 
d.getVar('systemd_unitdir', True))
         if os.path.exists(systemd_unitdir):
             shutil.rmtree(systemd_unitdir)
         systemd_libdir = os.path.dirname(systemd_unitdir)
         if (os.path.exists(systemd_libdir) and not 
os.listdir(systemd_libdir)):
             os.rmdir(systemd_libdir)
}
do_install[postfuncs] += "rm_systemd_unitdir "

Best Regards,
Chen Qi

