Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C3986BA1D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 15:58:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBDFw3hW022823
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 07:58:03 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Fri, 13 Dec 2013 07:58:02 -0800
Message-ID: <52AB2E8A.6060201@windriver.com>
Date: Fri, 13 Dec 2013 09:58:02 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAGDS+nmbUGR6r72_xGzMyouAyGiCpPL115eD8=keaouwrHshBA@mail.gmail.com>
In-Reply-To: <CAGDS+nmbUGR6r72_xGzMyouAyGiCpPL115eD8=keaouwrHshBA@mail.gmail.com>
Subject: Re: dora: systemd + package_deb = broken run-postinsts
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
X-List-Received-Date: Fri, 13 Dec 2013 15:58:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/13, 9:38 AM, Steve Sakoman wrote:
> A client has requested help setting up a build using debian packaging
> and systemd as the init system.
>
> When testing the initial image build I noticed that package postinsts
> didn't seem to run properly.
>
> It turns out that dpkg installs an S98run-postinsts file in /etc/rcS.d
> in addition to the normal S99run-postinsts link to
> /etc/init.d/run-postinsts.
>
> Systemd-compat-units installs a run-postinsts.service file that calls
> /etc/rcS.d/S99run-postinsts.
>
> I haven't investigated why the standard /etc/rcS.d/S99run-postinsts
> doesn't work properly for the debian case, but I have verified that
> changing the service file to use the dpkg provided
> /etc/rcS.d/S98run-postinsts works, as does changing dpkg to write
> S99run-postinsts instead of S98run-postinsts.
>
> I'm not sure what the "proper" fix is for this issue.  Any
> debian/systemd experts care to weigh in with advice?

Last time I looked into this problem, what appeared to be happening was the 
files run out of order.  I never did figure out why.

--Mark

> Regards,
>
> Steve
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


