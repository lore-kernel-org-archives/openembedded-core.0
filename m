Return-Path: <piotr.lewicki@elfin.de>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1B97B6FFD8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 14:46:27 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id t74so6415289wme.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Feb 2018 06:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elfin.de; s=google;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=t/t+Hyh5JiO43Cdvx9g4Q3Eq/heHTeTgF64MLElKHjk=;
	b=G3NpiCYRuMhz/U4/L1qdS4QcRfs2nIH8bwpuPJEMxx4k32B81RTYJqQeiqsCHRzthB
	JrtpmqUOs+qlj4Oh68MrMBk1sH5q09ylCNAdF3vyL3Ef+PcqdTUyWKSRpzZ029+bAsPL
	Q45TYTZoGamci/MSZunbTo4OA1B4veok61ELXXtyMjdvKgrLo52YA+phdwwEiBpth8Aj
	fqHjk9ilOFyIa2S1pERgHTKphmlZDkhvfXu5WGV7C8ZLe0A6TnFfg9/v+nAZWEcX4Hn5
	KXTL7c1fTtQ0C0one9S4Y2GdDkQUypGr1LY56bw0Vak43KhO0/IP2qojAdxuLQ3kMNyz
	PQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=t/t+Hyh5JiO43Cdvx9g4Q3Eq/heHTeTgF64MLElKHjk=;
	b=PyKSkQVo7s+Qbtkv1wivJuiuzh/7JZQoMc5GTp/Ou02UA4jqz1cY5baCkIwY5Fa57M
	QkydbfHTMscpaGRyI6NY7bI4l9ZSMuxj93R090FrmVFAoD3CNsqpU5B456YwirAj+cG/
	iGw/zHsq+gZ1lTB8DUXmd+gMIxyomNDYsSLi313wIMgnkwuXrX7E65fHPdRwxg/B+2lJ
	HD75z6uGOVU8zpdvUGhePgqnz6AlYYQbNfRUDxzLzbxiRzlfQl1xcbSpMlsQiWPgS7tM
	lpplTA3nSfX4IOh/GADrfeoGUM4V9vnzdHWvxs+Zn0CecEQKvG9+AFs+HOl+44KTnRyb
	jfaw==
X-Gm-Message-State: AKwxytfjbzajbgZx+FC8weZ2fbMAdBNYh5ArcAL6f/bu9IFwxy/zqKak
	v8+yLdePQNc3fU+VdZD5EBFfthUC1lQ=
X-Google-Smtp-Source: AH8x224OM0rWX2mUQAj1U30IvHG5lEGjsHI4QwYsx1ZNr4zOm5QGsZr7xeNIl6bUFRO0bI6O12Wn2A==
X-Received: by 10.28.210.145 with SMTP id j139mr29256350wmg.59.1517496388559; 
	Thu, 01 Feb 2018 06:46:28 -0800 (PST)
Received: from [192.168.2.129] (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114]) by smtp.gmail.com with ESMTPSA id
	g19sm23425383wrd.55.2018.02.01.06.46.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Feb 2018 06:46:28 -0800 (PST)
To: openembedded-core@lists.openembedded.org
From: Piotr Lewicki <piotr.lewicki@elfin.de>
Message-ID: <8c548149-e116-4b1f-8bfc-86099ac32e93@elfin.de>
Date: Thu, 1 Feb 2018 15:46:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
Subject: recipe using environment variable does not refresh / rebuild
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
X-List-Received-Date: Thu, 01 Feb 2018 14:46:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi,

I have a problem with forcing rebuild of the recipe depending on the 
environment variable.

In my recipe I have an anonymous python function that obtains the env 
variable and depending on it sets some other internal variables (needed 
by swupdate recipe):


python() {
     origenv = d.getVar("BB_ORIGENV", False)
     u_boot_enabled = origenv.getVar("ADD_UBOOT_TO_UPDATE", False)

     if u_boot_enabled == None:
         bb.warn("Not adding u-boot to the image")
     else:
         bb.warn("Adding u-boot to the image")
         d.appendVar("SWUPDATE_IMAGES", " u-boot.imx")
         d.setVarFlag("SWUPDATE_IMAGES_NOAPPEND_MACHINE", "u-boot.imx", "1")
}


My issue is that there is no difference when I either set or unset my 
environment variable "ADD_UBOOT_TO_UPDATE".


Can you point me a solution how I could force checking this variable and 
rerunning/rebuilding the recipe?


Thanks,

Piotr


