Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9362377133
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 10:20:09 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id r83-v6so3614799vkf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 03:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=nGLfrKVZOcz5UDEX4fOaJpRsquZoB8Rb0LEIhJu1amM=;
	b=m/1/oIOdavpqbU3yCKI/yGkZ1e/ywsy3WtRRvQzZxqQiRvIT6xekX2ECnGrAumR53i
	IPW9ywzxlO96MXAswVHyKdivwgXEHPoB2U+Zz1oSnCikNdtKhguQlZhGTJ7GflNGylb9
	czQaTnjzeX3iX5PG/hcudYsMBERQ39BdXaASylqzFhkHW+TfArlKpi78W8zi+8p/P82D
	m/Mmr0YvSjPsWFJQNKhWChb6eDrk4RbzM162u0rXLuht/Vq7zcCa4gPch/CSwz00qMrQ
	3ozFwGVqHkiQwP2a03ZOxMtHPo2ihp990pWQPdS8WLVs8lIhknvg/tzMaHz7lyhDw8tv
	TTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=nGLfrKVZOcz5UDEX4fOaJpRsquZoB8Rb0LEIhJu1amM=;
	b=cT+vdnmXOkeMz5solDSZqzvt2VpAOm3mcg560whH55jjKIF7dpL9y+fkIE6GoTEPqh
	d/TAAggNqatOBilFMtjzrBbQs0rsHpDkBL8IswI+tTZt9hH+tHnWtkFDVpjV5/Ytu5ww
	84QaCFrf3bBMeMRxX8b7DE61gN7Z340E1lgalm5m/sgMT/j0R48HuLycrXoa7cS03NYi
	EwwhbbY2I103LefO48XBk+uww+NiaObotdXx1gl53eShy9E+G2Xc4XFdsZsvnQHM94rD
	+f56f9vtGUPPf3MpyhsibOFgNv0iFDnlg0G7jnYriTLHrX58DeRjgTx5MeNQFMowT5lQ
	9Guw==
X-Gm-Message-State: APt69E1Zjnxaucyyo40IbysKmmU+V88X5mzU1bePL5IfHj+Vq2tDihxU
	capt4Nuz3X9ekN+nOht1zQZOgdqOsu9I4h7BzXiVjxdv
X-Google-Smtp-Source: ADUXVKJ0xqnxLSt6lp7x5/00ch0Zb46bCuOgMxFc9UHe/ce6dYr9Q/OE8lOnvR7ifLwdG5Fo+Ju+/2P47/7TfFWN5Dk=
X-Received: by 2002:a1f:b593:: with SMTP id
	e141-v6mr599602vkf.171.1529662810319; 
	Fri, 22 Jun 2018 03:20:10 -0700 (PDT)
MIME-Version: 1.0
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 22 Jun 2018 11:19:59 +0100
Message-ID: <CAO5Uq5QysPpO48CtkpvZ00HToezJxccO_j_HBnTp_OMwcGmncw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org, juro.bystricky@intel.com
Subject: reproducible_final_image_task failing when REPRODUCIBLE_TIMESTAMP_ROOTFS unset
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
X-List-Received-Date: Fri, 22 Jun 2018 10:20:09 -0000
Content-Type: text/plain; charset="UTF-8"

I'm trying to use BUILD_REPRODUCIBLE_BINARIES, but I tripped over a
problem when I'd not set REPRODUCIBLE_TIMESTAMP_ROOTFS.

In the reproducible_final_image_task (), we try to set
REPRODUCIBLE_TIMESTAMP_ROOTFS based on the top most git timestamp, but
that's failing because the working directory at that point is my build
directory, which isn't git controlled:

| NOTE: Executing reproducible_final_image_task ...
| DEBUG: Executing shell function reproducible_final_image_task
| fatal: Not a git repository (or any of the parent directories): .git
| WARNING: /home/vagrant/poky-master/build/tmp/work/nanohub-poky-linux-gnueabi/nano-image-core/1.0-r0/temp/run.reproducible_final_image_task.3664:1
exit 128 from 'REPRODUCIBLE_TIMESTAMP_ROOTFS=`git log -1
--pretty=%ct`'

Clearly just setting REPRODUCIBLE_TIMESTAMP_ROOTFS in my global config
fixes the problem, but that doesn't help anyone else trying to use
this... I'm really not sure what repo that piece of code is intending
to target.

-- 
Alex Kiernan

